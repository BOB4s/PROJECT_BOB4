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
import org.springframework.validation.BindingResult;
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
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Music_library;
import global.sesoc.teamBOB4.vo.Post;
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
		int post_number = postdao.getOneByMus_number(post.getMus_number(),post.getPost_content());
		
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
	public String postGetOne(int post_number,Model model) {

	
		List <String> tagList = new ArrayList<>();
		List<Integer> tagnumList=post_tagdao.GetlinkedTags(post_number);
		
		
		for (int tag_number:tagnumList) {
			//tagList.add(tagdao.selectTagnameByTagnum(tag_number));
			
		}
		Post post=postdao.getPostByPostNum(post_number);
		
		model.addAttribute("tagList",tagList);
		model.addAttribute("post",post);
		
		return "post/postDetail";

	}

}
