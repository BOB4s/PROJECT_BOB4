package global.sesoc.teamBOB4;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.teamBOB4.dao.MakeDao;
import global.sesoc.teamBOB4.dao.MusicDao;
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Key_sound;
import global.sesoc.teamBOB4.vo.Sound_library;
import global.sesoc.teamBOB4.vo.Temp;

@Controller
@RestController
public class MakeController {
	
	@Autowired
	MakeDao dao;
	
	final String uploadPath = "uploadPath/";
	
	@PostMapping("/inserttemp")
	public int inserttemp(Temp temp, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		temp.setCust_number(cust);
		return dao.inserttemp(temp);
	}
}
