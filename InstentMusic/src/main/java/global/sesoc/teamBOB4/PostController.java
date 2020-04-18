package global.sesoc.teamBOB4;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.dao.Post_tagDao;
import global.sesoc.teamBOB4.dao.TagDao;
import global.sesoc.teamBOB4.vo.Post;

@Controller
public class PostController {
	@Autowired
	PostDao postdao;
	@Autowired
	TagDao tagdao;
	@Autowired
	Post_tagDao post_tagdao;
	
	@GetMapping("/postWrite")
	public String postWrite() {
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
		mus_numbers = 123;
		post.setMus_number(mus_numbers);
		post.setCust_number(cust_numbers);
		post.setMus_title(mus_title);
		post.setMus_time(mus_time);
		post.setPost_content(post_content);
		post.setPost_nickname(post_nickname);
		post.setPost_url(post_url);

		int result = postdao.post_save_method(post);

		int post_number = postdao.getOneByMus_number(post.getMus_number());
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
		System.out.println(text);
		System.out.println(post_number);

		int tag_number = tagdao.selectTagLink(text);
		post_tagdao.linkedTags(post_number, tag_number);
		return "success";

	}

	@RequestMapping(value = "/postLists", method = RequestMethod.GET)
	public String postLists(@RequestParam(value = "searchWord", defaultValue = "") String searchWord, Model model) {

		Map<String,List<Post>> postList = postdao.getPostAll(searchWord);
		/*
		 * for (Post post:postList.get("title")) {
		 * System.out.println(post.getMus_title()+"//"+post.getPost_number());
		 * 
		 * } System.out.println(postList.get("title").size());
		 */
		String controls="title";		
		if(searchWord.equals("title")) {
			controls ="title";
		}
		model.addAttribute("controls",controls);
		model.addAttribute("postList", postList);
		model.addAttribute("searchWord", searchWord);

		return "main";
	}

}
