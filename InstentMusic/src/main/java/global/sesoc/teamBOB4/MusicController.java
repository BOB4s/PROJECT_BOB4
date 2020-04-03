package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import global.sesoc.teamBOB4.dao.MusicDao;
import global.sesoc.teamBOB4.vo.Sound_library;

@Controller
@RestController
public class MusicController {
	
	@Autowired
	MusicDao dao;

	@GetMapping("/getSoundlib")
	public List<Sound_library> getSoundlib(HttpSession session){
		int cust_number = (int)session.getAttribute("login");
		return dao.getSoundlib(cust_number);
	}
	
	@PostMapping("/insertSound")
	public int insertSound(Sound_library sound, HttpSession session) {
		sound.setCust_number((int)session.getAttribute("login"));
		return dao.insertSound(sound);
	}
}
