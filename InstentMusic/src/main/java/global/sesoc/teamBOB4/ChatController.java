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
import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.MessageList;

@Controller
public class ChatController {

	@Autowired
	ChatDao chatdao;
	@Autowired
	CustomerDao custdao;
	@RequestMapping(value = "/CreateChatRoom", method = RequestMethod.POST)
	public @ResponseBody int CreateChatRoom(MessageList newList ,Model model) {
		int messangerRoom = 0;
		
		messangerRoom = chatdao.selectmessangerRoom(newList);
		if(messangerRoom==0) {
			messangerRoom = chatdao.selectmessangerRoom2(newList);
		}
		if(messangerRoom==0) {
		chatdao.createChatRoom(newList);
		messangerRoom = chatdao.selectmessangerRoom(newList);
		model.addAttribute("messangerRoom",messangerRoom);
		}
		return messangerRoom;
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
		for(MessageList temps:RoomList2) {
			String temp = temps.getUserName();
			temps.setUserName(temps.getOpponentName());
			temps.setOpponentName(temp);
		RoomList.add(temps);
		
		}
		for(MessageList ml : RoomList) {
			if(opponentName.equals(ml.getOpponentName())) {
				if(UserName.equals(ml.getUserName())) 
					messangerRoom =ml.getMessangerRoom();
				
			}
			if(UserName.equals(ml.getOpponentName())) {
				if(opponentName.equals(ml.getUserName())) 
					messangerRoom =ml.getMessangerRoom();	
			}	
			
			int cust_number1 = custdao.get_cust_number_by_nickname(ml.getOpponentName());
			Customer customer = custdao.searchOne_ByCustnumber_getProfile(cust_number1);
			if(customer!=null) 
			ml.setOppsProfile(customer.getCust_photo_saved());
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
	public @ResponseBody MessageList getOppsName(MessageList temp,HttpSession session) {
		
		/* (String) session.getAttribute("nickname"); */
		String cust_nickname = temp.getUserName();
		System.out.println(cust_nickname);
		
	  MessageList mesList =chatdao.selectMesRoom(temp.getMessangerRoom());
	  
	  if(temp.getUserName().equals(mesList.getOpponentName())) {
		  String tempstr = "";
		  tempstr = mesList.getOpponentName();
		  mesList.setOpponentName(mesList.getUserName());	 
		  mesList.setUserName(tempstr);
	  }  
	  System.out.println(mesList.toString());
	  int cust_number1 = 0;
	    if(cust_nickname.equals(mesList.getOpponentName())) {
	   	 cust_number1 = custdao.get_cust_number_by_nickname(mesList.getOpponentName());
	  }
	    if(cust_nickname.equals(mesList.getUserName())) {
	     	cust_number1 = custdao.get_cust_number_by_nickname(mesList.getUserName());
	    
	 	  }
	 if(cust_number1!=0) {
	   Customer customer = custdao.searchOne_ByCustnumber_getProfile(cust_number1);
	  	mesList.setOppsProfile(customer.getCust_photo_saved());
	  	
	 }
	return mesList;
}
}
