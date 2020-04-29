package global.sesoc.teamBOB4;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.ListDao;
import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.dao.Post_tagDao;
import global.sesoc.teamBOB4.dao.TagDao;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Music_library;
import global.sesoc.teamBOB4.vo.Post;
import global.sesoc.teamBOB4.vo.SearchWord;
import global.sesoc.teamBOB4.vo.Post_tag;
import global.sesoc.teamBOB4.vo.Tag;

@Controller
public class PostController {
	@Autowired
	PostDao postdao;
	@Autowired
	TagDao tagdao;
	@Autowired
	Post_tagDao post_tagdao;
	@Autowired
	CustomerDao custdao;
	
	final String uploadPath = "uploadPath/";

	@GetMapping("/postWrite")
	public String postWrite(int mus_number, Model model,HttpSession session) {
		int follow_number =(int)session.getAttribute("cust_number");
		List<Integer> followerList = custdao.getFollowers(follow_number) ;
		model.addAttribute("followerList",followerList);
		model.addAttribute("mus_number", mus_number);
		return "post/postWrite";
	}
	
	@PostMapping("/postup")
	public @ResponseBody int post_write_save(String[] tags, Post post, MultipartFile file, HttpSession session, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		String savedFilename = FileService.saveFile(file, savePath);
		post.setPost_original(savedFilename);
		post.setPost_nickname((String)session.getAttribute("nickname"));
		
		int result = postdao.post_save_method(post);
		int post_number = postdao.getOneByMus_number(post);
		
		for(int i=1; i<tags.length; i++) {
			Tag t = new Tag();
			t.setTag_name(tags[i]);
			
			System.out.println();
			
			Tag tresult = tagdao.selectTag(t);
			System.out.println("tresult.getTag_number() : "+tresult.getTag_number());
			post_tagdao.linkedTags(post_number, tresult.getTag_number());
		}
		
		return post_number;
	}
	
	@RequestMapping(value = "/postLists", method = RequestMethod.GET)
	public @ResponseBody List<Post> postLists(
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord,
			@RequestParam(value = "start_Page", defaultValue = "0") int start_Page,
			@RequestParam(value = "cust_number", defaultValue = "0") int cust_number,
		 Model model) {
		List <Integer> follwedList =custdao.getFollowings(cust_number);
		List<Post> post_All_List_byFollow = postdao.getPostAll(follwedList);
		
		List<Post> postList =new ArrayList<>();
		int page_control_int=3;
		if(start_Page==0) 
			page_control_int=6;
		for (int i=0;i<page_control_int;i++) {
			if(i+(start_Page*page_control_int)>=post_All_List_byFollow.size()) {
				break;
			}
			postList.add(post_All_List_byFollow.get(i+(start_Page*page_control_int)));
		}
		
		/*
		 * for (Post post:postList.get("title")) {
		 * System.out.println(post.getMus_title()+"//"+post.getPost_number());
		 * 
		 * } System.out.println(postList.get("title").size());
		 */
		String controls = "title";
		if (searchWord.equals("title")) {
			controls = "title";
		}
	
		
		/* model.addAttribute("postList", postList); */
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("controls", controls);
		return postList;
	}
	@GetMapping("/myList")
	public @ResponseBody List<Post> myList(@RequestParam(value = "start_Page", defaultValue = "0") int start_Page,
			int cust_number){
		
		List<Post> myList = postdao.myList(cust_number);
		List<Post> temp = new ArrayList<>();
		int page_control_int=3;
		if(start_Page==0) 
			page_control_int=6;
		for (int i=0;i<page_control_int;i++) {
			if(i+(start_Page*page_control_int)>=myList.size()) {
				break;
			}
			temp.add(myList.get(i+(start_Page*page_control_int)));
		}
		
		return temp;
	}
	@ResponseBody
	@PostMapping("/inserttag")
	public int inserttag(Tag tag) {
		Tag result = tagdao.selectTag(tag);
		if(result==null) {
			int result2 = tagdao.inserttag(tag);
			return result2;
		}
		return 0;
	}
	
	@GetMapping("/postGetOne")
	public String postGetOne(
			@RequestParam(value = "post_number", defaultValue = "0") int post_number,
			@RequestParam(value = "mus_number", defaultValue = "0") int mus_number,Model model) {

	if(post_number==0&&mus_number!=0) {
			Post post = new Post();
			post.setMus_number(mus_number);
		 post_number = postdao.getOneByMus_number(post);
	}
		/*
		 * List <Tag> tagList = new ArrayList<>(); List<Integer>
		 * tagnumList=post_tagdao.GetlinkedTags(post_number);
		 * 
		 * 
		 * for (int tag_number:tagnumList) { Tag t = new Tag();
		 * t.setTag_number(tag_number); tagList.add(tagdao.selectTag(t));
		 * 
		 * }
		 */
		
		Post post=postdao.getPostByPostNum(post_number);
		if(post.getPost_original()==null) {
			post.setPost_original("resources/images/IUfeed.jpg");
		}else {
			post.setPost_original("resources/uploadPath/"+post.getPost_original());
		}
		
		//model.addAttribute("tagList",tagList);
		model.addAttribute("post",post);
		
		return "post/postDetail";

	}
	@ResponseBody
	@GetMapping("/searchpost")
	public List<SearchWord> searchpf(String search_word){
		List<SearchWord> result = postdao.searchPost(search_word);
		return result;
	}
	@ResponseBody
	@GetMapping("/postList")
	public List<Post> postList(String search_word){
		SearchWord result1 = postdao.searchcheck(search_word);
		if(result1==null) {
			postdao.insertWord(search_word);
		}
		List<Post> result = postdao.postList(search_word);
		return result;
	}

}
