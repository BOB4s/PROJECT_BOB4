package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import global.sesoc.teamBOB4.dao.ListDao;
import global.sesoc.teamBOB4.vo.Music_library;

@Controller
@RestController
public class ListController {

	@Autowired
	ListDao dao;
	
	@GetMapping("/getmusics")
	public List<Music_library> getmusics(HttpSession session){
		Music_library music = new Music_library();
		int cust_number = (int)session.getAttribute("login");
		music.setCust_number(cust_number);
		return dao.getmusics(music);
	}
}
