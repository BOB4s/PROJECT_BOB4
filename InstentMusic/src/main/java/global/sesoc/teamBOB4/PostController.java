package global.sesoc.teamBOB4;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.dao.TagDao;
import global.sesoc.teamBOB4.vo.Post;

@Controller
public class PostController {
	@Autowired
	PostDao postdao;
	@Autowired
	TagDao tagdao;
	@GetMapping("/postWrite")
	public String postWrite() {
		return "post/postWrite";
	}

	@PostMapping("/post_write_save")
	public String login(Post post) {
		System.out.println(post.toString());
		postdao.post_save_method(post);
		
		return "main";
	}
	@RequestMapping(value = "/tagsSaved", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String tagsSaved(String tag_name) {
		int tag_number=tagdao.selectTagLink(tag_name);
		/*String tag_number =""*/
		String resp = "<a href=teamBOB4/seach/tag="+tag_number+">"+tag_name+"</a>";
		return resp;
	}
	
}
