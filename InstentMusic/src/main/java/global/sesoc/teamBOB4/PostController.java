package global.sesoc.teamBOB4;

import java.util.ArrayList;
import java.util.List;

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

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.dao.Post_tagDao;
import global.sesoc.teamBOB4.dao.TagDao;
import global.sesoc.teamBOB4.vo.Follow;
import global.sesoc.teamBOB4.vo.Like_click;
import global.sesoc.teamBOB4.vo.Post;

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

	@GetMapping("/postWrite")
	public String postWrite( Model model,HttpSession session) {
		
		int follow_number =(int)session.getAttribute("cust_number");
	List<Integer> followerList = custdao.getFollowers(follow_number) ;
		model.addAttribute("followerList",followerList);
		
		return "post/postWrite";
	}

	@GetMapping("/infinity")
	public String infinity() {
		return "infinity";
	}

	@PostMapping("/post_write_save")
	public @ResponseBody int post_write_save(String mus_number, String cust_number, String mus_title, String mus_time,
			String post_content, String post_nickname, String post_url) {
		int mus_numbers = Integer.parseInt(mus_number);
		int cust_numbers = Integer.parseInt(cust_number);
		Post post = new Post();
		
		post.setMus_number(mus_numbers);
		post.setCust_number(cust_numbers);
		post.setMus_title(mus_title);
		post.setMus_time(mus_time);
		post.setPost_content(post_content);
		post.setPost_nickname(post_nickname);
		post.setPost_url(post_url);
		int result = postdao.post_save_method(post);

		int post_number = postdao.getOneByMus_number(mus_numbers);
		/*
		 * for (String temp : tags_List) { System.out.println(temp); int tag_number =
		 * tagdao.selectTagLink(temp); post_tagdao.linkedTags(post_number, tag_number);
		 * 
		 * }
		 */

		return post_number;
	}

	@GetMapping("/tag_write_save")
	public @ResponseBody String login(String text, int resp) {

		int post_number = resp;

		int tag_number = tagdao.selectTagLink(text);
		post_tagdao.linkedTags(post_number, tag_number);
		return "success";

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
	
	@GetMapping("/postGetOne")
	public String postGetOne(
			@RequestParam(value = "post_number", defaultValue = "0") int post_number,
			@RequestParam(value = "mus_number", defaultValue = "0") int mus_number,Model model) {

	if(post_number==0&&mus_number!=0) {
		 post_number = postdao.getOneByMus_number(mus_number);
	}
		List <String> tagList = new ArrayList<>();
		List<Integer> tagnumList=post_tagdao.GetlinkedTags(post_number);
		
		
		for (int tag_number:tagnumList) {
			tagList.add(tagdao.selectTagnameByTagnum(tag_number));
			
		}
		Post post=postdao.getPostByPostNum(post_number);
		
		model.addAttribute("tagList",tagList);
		model.addAttribute("post",post);
		
		return "post/postDetail";

	}
	
	@RequestMapping(value = "/like_click", method = RequestMethod.GET)
	public @ResponseBody String like_click(Like_click Like_click) {
				System.out.println(Like_click.toString());
		int result =postdao.checkLike_click(Like_click);
		if (result == 0) {
			 postdao.newliked(Like_click);
			 System.out.println("조아여");
			return "liked";
		}
		 postdao.unliked(Like_click);
		 System.out.println("시러여");
		return "unliked";
	
	}
	@RequestMapping(value = "/likedchecking", method = RequestMethod.GET)
	public @ResponseBody String followchecking(Like_click Like_click) {

		int result =postdao.checkLike_click(Like_click);
		if (result == 0) 
			return "unliked";
		if(result == 1) 
		return "liked";
		return "liked";
	
	}

}
