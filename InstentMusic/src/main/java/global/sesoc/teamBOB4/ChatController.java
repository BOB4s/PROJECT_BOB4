package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamBOB4.dao.ChatDao;
import global.sesoc.teamBOB4.vo.MessageList;

@Controller
public class ChatController {

	@Autowired
	ChatDao chatdao;

	@RequestMapping(value = "/CreateChatRoom", method = RequestMethod.POST)
	public @ResponseBody String CreateChatRoom(MessageList newList ,Model model) {
		int messangerRoom = 0;
		
		messangerRoom = chatdao.selectmessangerRoom(newList);
		if(messangerRoom==0) {
			messangerRoom = chatdao.selectmessangerRoom2(newList);
		}
		if(messangerRoom==0) {
		chatdao.createChatRoom(newList);
		model.addAttribute("messangerRoom",messangerRoom);
		}
		return "";
	}
	
@RequestMapping(value = "/chattingTemp", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String chattingTemp(
		@RequestParam(value = "messangerRoom", defaultValue = "0") int messangerRoom,
		@RequestParam(value = "UserName", defaultValue = "") String UserName,
		@RequestParam(value = "opponentName", defaultValue = "") String opponentName,
		Model model,HttpSession session) {
	
		String username =(String)session.getAttribute("nickname");
		List<MessageList> RoomList = chatdao.getUsersChatRoom(username);
		List<MessageList> RoomList2 = chatdao.getUsersChatRoom2(username);
		for(MessageList temps:RoomList2)
		RoomList.add(temps);
		
		for(MessageList ml : RoomList) {
			if(opponentName.equals(ml.getOpponentName())) {
				if(UserName.equals(ml.getUserName())) 
					messangerRoom =ml.getMessangerRoom();
				
			}
			if(UserName.equals(ml.getOpponentName())) {
				if(opponentName.equals(ml.getUserName())) 
					messangerRoom =ml.getMessangerRoom();	
			}	
		}
		model.addAttribute("opponentName",opponentName);
		model.addAttribute("RoomList",RoomList);
		model.addAttribute("messangerRoom",messangerRoom);
		
		return "chattingTemp";
	}

	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String popup() {
		return "pop";
	}

	@RequestMapping(value = "/getOppsName", method = RequestMethod.GET,produces = "application/json; charset=utf8")
	public @ResponseBody MessageList getOppsName(MessageList temp) {
		
	  MessageList mesList =chatdao.selectMesRoom(temp.getMessangerRoom());
	  if(temp.getUserName().equals(mesList.getOpponentName())) {
		  mesList.setOpponentName(mesList.getUserName());
	}
	return mesList;
}
}
