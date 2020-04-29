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

import global.sesoc.teamBOB4.dao.MusicDao;
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Key_sound;
import global.sesoc.teamBOB4.vo.Sound_library;

@Controller
@RestController
public class MusicController {
	
	@Autowired
	MusicDao dao;
	
	final String uploadPath = "uploadPath/";

	@GetMapping("/getSoundlib")
	public List<Sound_library> getSoundlib(HttpSession session){
		int cust_number = (int)session.getAttribute("login");
		return dao.getSoundlib(cust_number);
	}
	
	@GetMapping("/getSounds")
	public List<Sound_library> getSounds(Sound_library sound,HttpSession session){
		int cust_number = (int)session.getAttribute("login");
		sound.setCust_number(cust_number);
		List<Sound_library> result = dao.getSounds(sound);
		for(Sound_library s : result) {
			String fullPath = "resources/"+uploadPath+s.getSou_saved();
			if(sound.getSou_type().equals("added")) {
				Sound_library added = new Sound_library();
				int a = Integer.parseInt(s.getSou_name());
				added.setSou_number(a);
				List<Sound_library> original = dao.getorigin(added);
				for(Sound_library o : original) {
					fullPath = "resources/"+uploadPath+o.getSou_saved();
					s.setSou_name(o.getSou_name());
				}
			}
			s.setFullPath(fullPath);
		}
		return result;
	}
	
	
	@GetMapping("/searchsound")
	public List<Sound_library> searchsound(String search, HttpSession session){
		int cust_number = (int)session.getAttribute("login");
		Map <String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("cust_number", cust_number);
		List<Sound_library> result = dao.searchsound(map);
		for(Sound_library s : result) {
			String fullPath = "resources/"+uploadPath+s.getSou_saved();
			s.setFullPath(fullPath);
		}
		return result;
	}
	
	@PostMapping("/insertSound")
	public int insertSound(Sound_library sound, HttpSession session) {
		sound.setCust_number((int)session.getAttribute("login"));
		return dao.insertSound(sound);
	}
	
	@PostMapping("/editlib")
	public int editlib(String new_type, Sound_library sound, HttpSession session) {
		sound.setCust_number((int)session.getAttribute("login"));
		Map<String, Object> map = new HashMap<>();
		map.put("new_type",new_type);
		map.put("Sound", sound);
		return dao.editlib(map);
	}
	
	@PostMapping("/deletelib")
	public int deletelib(Sound_library sound, HttpSession session, HttpServletRequest request) {
		sound.setCust_number((int)session.getAttribute("login"));
		if(!sound.getSou_type().equals("added")) {
			String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
			String savePath = rootPath + "/resources/"+uploadPath ;
			
			List<Sound_library> result = dao.getSounds(sound);
			
			for(Sound_library r : result) {
				String fullPath = savePath+r.getSou_saved();
				
				FileService.deleteFile(fullPath);
			}
		}
		return dao.deletelib(sound);
	}
	
	@PostMapping("/sendFile")
	public String sendFile(Sound_library sound, MultipartFile file, HttpSession session, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("/") ;//리얼경로
		String savePath = rootPath + "/resources/"+uploadPath ;
		
		int cust = (int) session.getAttribute("login");
		sound.setCust_number(cust);

		String savedFilename = FileService.saveFile(file, savePath);
		String originalFilename = sound.getSou_name();
		sound.setSou_name(originalFilename);
		sound.setSou_saved(savedFilename);

		int result = dao.insertSound(sound);
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@PostMapping("/insertkey")
	public int insertkey(Key_sound keys, HttpSession session) {
		int cust = (int) session.getAttribute("login");
		keys.setCust_number(cust);
		return dao.insertkey(keys);
	}
	
	@PostMapping("/delkey")
	public int delkey(Key_sound keys) {
		return dao.delkey(keys);
	}
	
	@PostMapping("/updatekey")
	public int updatekey(Key_sound keys) {
		return dao.updatekey(keys);
	}
	
	@GetMapping("/getkeys")
	public List<Key_sound> getkeys(Key_sound keys, HttpSession session){
		int cust = (int) session.getAttribute("login");
		keys.setCust_number(cust);
		return dao.getkeys(keys);
	}
	
}
