package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamBOB4.dao.ChatDao;
import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.MessageDao;
import global.sesoc.teamBOB4.vo.Message;
import global.sesoc.teamBOB4.vo.MessageList;

@Controller
public class ChatController {
	
	@Autowired
	ChatDao chatdao;
	@Autowired
	MessageDao mesdao;
	@Autowired
	CustomerDao custdao;
	
	@RequestMapping(value = "/CreateChatRoom", method = RequestMethod.POST)
	public String CreateChatRoom(MessageList newList ,Model model) {
		int messangerRoom = 0;
		System.out.println(newList.getOpponentName());
		messangerRoom = chatdao.selectmessangerRoom(newList);
		if(messangerRoom==0) {
		chatdao.createChatRoom(newList);
		messangerRoom=chatdao.selectmessangerRoom(newList);
		}
		Message mstemp = new Message();
		if(mstemp.getMes_File()==null) {
			mstemp.setMes_File("");
		}
		mstemp.setCust_nickname(newList.getUserName());
		mstemp.setMes_content(newList.getRecentMessage());
		mstemp.setMessangerRoom(messangerRoom);
		 mesdao.savedMessage(mstemp);
		 
		 MessageList msList =new MessageList();
			msList.setRecentMessage(mstemp.getMes_content());
			msList.setMessangerRoom(messangerRoom);
			chatdao.setRecentMessage(msList);
			
		model.addAttribute("messangerRoom",messangerRoom);
		return "chattingTemp";
	}

	@GetMapping("/chattingTemp")
	public String chattingTemp(
			@RequestParam(value = "messangerRoom", defaultValue = "0") int messangerRoom,Model model,HttpSession session) {
		
		String cust_nickname = (String) session.getAttribute("nickname");
		List<MessageList> RoomList = chatdao.getUsersChatRoom(cust_nickname);
		for (MessageList mslist : RoomList) {
			String nickname =mslist.getOpponentName();
			String cust_photo_saved =custdao.getCust_photo_saved(nickname);
				mslist.setOppsProfile(cust_photo_saved);
		}
		
/*		int cust_number=123;
		model.addAttribute("cust_number",cust_number);*/
		model.addAttribute("cust_nickname",cust_nickname);
		model.addAttribute("RoomList",RoomList);
		model.addAttribute("messangerRoom",messangerRoom);
		
		return "chattingTemp";
	}

	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String popup(Model model) {
		
		return "pop";
	}
	@ResponseBody
	@RequestMapping(value = "/getOppsName", method =RequestMethod.GET)
	public MessageList getOppsName(MessageList msList) {
		
		String OppsName =chatdao.getOppsName(msList);
		String cust_photo_saved =custdao.getCust_photo_saved(OppsName);
		if(cust_photo_saved==null) {
			cust_photo_saved="none";
		}
		msList.setOpponentName(OppsName);
		msList.setOppsProfile(cust_photo_saved); 
		 return msList;
	}

}
