package global.sesoc.teamBOB4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.teamBOB4.dao.MakeDao;
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Part_music;
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
	
	@GetMapping("/gettemp")
	public Temp gettemp(HttpSession session){
		int cust = (int) session.getAttribute("login");
		Temp temp = new Temp();
		temp.setCust_number(cust);
		Temp result = dao.gettemp(temp);
		return result;
	}
	
	@PostMapping("/updatetemp")
	public int updatetemp(Temp temp, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		temp.setCust_number(cust);
		return dao.updatetemp(temp);
	}
	
	@PostMapping("/deltemp")
	public int deltemp(Temp temp, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		temp.setCust_number(cust);
		return dao.deltemp(temp);
	}
	
	@RequestMapping(value = "/sendpart", method = RequestMethod.POST)
	public String sendpart(Part_music parts, MultipartFile file, HttpSession session, HttpServletRequest request) {
		System.out.println("ddd");
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);

		String savedFilename = FileService.saveFile(file, savePath);
		parts.setPhrase_saved(savedFilename);

		int result = dao.sendpart(parts);
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
}
