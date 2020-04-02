package global.sesoc.teamBOB4;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.teamBOB4.dao.ChatDao;
import global.sesoc.teamBOB4.vo.MessageList;

@Controller
public class ChatController {

	@Autowired
	ChatDao chatdao;

	@RequestMapping(value = "/CreateChatRoom", method = RequestMethod.POST)
	public String CreateChatRoom(MessageList newList) {

		int result=chatdao.createChatRoom(newList);
		
		
		return "chattingTemp";
	}

	@GetMapping("/chattingTemp")
	public String chattingTemp(Model model) {
		String username ="123";
		
		List<MessageList> RoomList = chatdao.getUsersChatRoom(username);
		
		model.addAttribute("username",username);
		model.addAttribute("RoomList",RoomList);
		
		
		return "chattingTemp";
	}

	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String popup() {
		return "pop";
	}

}
