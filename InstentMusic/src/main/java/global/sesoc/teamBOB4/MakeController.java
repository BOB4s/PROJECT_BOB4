package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.teamBOB4.dao.MakeDao;
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Music_library;
import global.sesoc.teamBOB4.vo.Part_music;
import global.sesoc.teamBOB4.vo.Temp;

@RestController
@Controller
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
		if(result!=null) {
			String fullPath = "resources/"+uploadPath+result.getTemp_saved();
			result.setFullPath(fullPath);}
		return result;
	}
	
	@PostMapping("/updatetemp")
	public int updatetemp(Temp temp, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		temp.setCust_number(cust);
		return dao.updatetemp(temp);
	}
	
	@PostMapping("/deltemp")
	public int deltemp(Temp temp, Part_music parts, HttpSession session, HttpServletRequest request) {
		int cust = (int) session.getAttribute("login");
		temp.setCust_number(cust);
		parts.setCust_number(cust);
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		List<Part_music> result = dao.getall(parts);
		
		for(Part_music r : result) {
			String fullPath = savePath+r.getPhrase_saved();
			
			FileService.deleteFile(fullPath);
		}
		
		Temp result2 = dao.gettemp(temp);
		
		String fullPath = savePath+result2.getTemp_saved();
		
		FileService.deleteFile(fullPath);
		
		 dao.deltemp(temp);
		 dao.delparts(parts);
		 return 1;
	}
	
	@PostMapping("/delpartone")
	public int delpartone(Part_music parts, HttpSession session, HttpServletRequest request) {
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);
		
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		List<Part_music> result = dao.getparts(parts);
		
		for(Part_music r : result) {
			String fullPath = savePath+r.getPhrase_saved();
			
			FileService.deleteFile(fullPath);
		}
		
		 return dao.delpartone(parts);
	}
	
	@GetMapping("/saveinfo")
	public int saveinfo(int part_num, int temp_bpm, HttpSession session) {
		session.setAttribute("part_num", part_num);
		session.setAttribute("temp_bpm", temp_bpm);
		return 1;
	}
	
	@PostMapping("/sendPart")
	public int send(Part_music parts, HttpSession session, MultipartFile file, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);

		String savedFilename = FileService.saveFile(file, savePath);
		parts.setPhrase_saved(savedFilename);

		return dao.sendpart(parts);
	}
	
	@GetMapping("/getparts")
	public List<Part_music> getparts(Part_music parts, HttpSession session){
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);
		List<Part_music> result = dao.getparts(parts);
		for(Part_music s : result) {
			String fullPath = "resources/"+uploadPath+s.getPhrase_saved();
			s.setFullPath(fullPath);
		}
		return result;
	}
	
	@GetMapping("/getall")
	public List<Part_music> getall(HttpSession session){
		Part_music parts = new Part_music();
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);
		List<Part_music> result = dao.getall(parts);
		for(Part_music s : result) {
			String fullPath = "resources/"+uploadPath+s.getPhrase_saved();
			s.setFullPath(fullPath);
		}
		return result;
	}
	
	@PostMapping("/uploadtemp")
	public int uploadtemp(HttpSession session, MultipartFile file, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		Temp temp = new Temp();
		
		int cust = (int) session.getAttribute("login");
		temp.setCust_number(cust);

		String savedFilename = FileService.saveFile(file, savePath);
		temp.setTemp_saved(savedFilename);

		return dao.uploadtemp(temp);
	} 
	
	@PostMapping("/savemusic")
	public int savemusic(HttpSession session, MultipartFile file, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		int cust = (int) session.getAttribute("login");
		Music_library music = new Music_library();
		Temp temp = new Temp();
		Part_music parts = new Part_music();
		
		music.setCust_number(cust);
		temp.setCust_number(cust);
		parts.setCust_number(cust);
		
		Temp result2 = dao.gettemp(temp);
		music.setMus_saved(result2.getTemp_saved());
		music.setMus_title(result2.getTemp_title());
		int result3 = dao.savemusic(music);
		
		List<Part_music> result = dao.getall(parts);
		for(Part_music r : result) {
			String fullPath = savePath+r.getPhrase_saved();
			
			FileService.deleteFile(fullPath);
		}
		
		dao.deltemp(temp);
		dao.delparts(parts);
		
		return 1;
	}
	
	@PostMapping("/delphrase")
	public int delphrase(Part_music parts, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);
		return dao.delphrase(parts);
	}
	
	@PostMapping("/insertloop")
	public int insertloop(Part_music parts, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		parts.setCust_number(cust);
		return dao.sendpart(parts);
	}
}
