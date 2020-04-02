package global.sesoc.teamBOB4;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.vo.MessageList;

@Controller
public class ChatController {

	@Autowired
	ChatDao chatdao;
	
	
	@RequestMapping(value = "/CreateChatRoom", method = RequestMethod.POST)
	public String CreateChatRoom( MessageList newList,String sendDatas) {
		
		
		
		
		
		return "chattingTemp";
	}	@GetMapping("/chattingTemp")
	public String chattingTemp() {
		return "chattingTemp";
	}

	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String popup() {
		return "pop";
	}
	
	
	
	
}
