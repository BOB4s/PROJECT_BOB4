package global.sesoc.teamBOB4;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.MessageDao;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Message;

@Controller

public class WebSocketController {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	static Boolean runCheck = false;
	@Autowired
	MessageDao mesdao;
	@Autowired
	CustomerDao custdao;

	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
	// WebSocket으로 메시지가 오면 요청되는 함수

	/*
	 * @OnMessage public void onMessage(String message, Session session) throws
	 * IOException { System.out.println(message); synchronized(clients) {
	 * for(Session client : clients) { if(!client.equals(session)) {
	 * client.getBasicRemote().sendText(message); } } } }
	 */

	@GetMapping("/pastChatGet")
	public @ResponseBody List<Message> pastChatGet(int messangerRoom, HttpSession session) {
		
		List<Message> MsList = mesdao.getChatedAll(messangerRoom);
		
		String cust_nickname = (String) session.getAttribute("cust_nickname");
		for (Message mes : MsList) {
			if (!mes.getCust_nickname().equals(cust_nickname)) {
				int cust_number1 = custdao.get_cust_number_by_nickname(mes.getCust_nickname());
				Customer customer = custdao.searchOne_ByCustnumber_getProfile(cust_number1);
				mes.setMes_savefile(customer.getCust_photo_saved());
			}
		}

		return MsList;
	}

	@RequestMapping(value = "/socketsend", method = RequestMethod.GET)
	public @ResponseBody List<Message> handleMessage(Message mstemp) {

		// 메시지 내용을 저장하는
		if (mstemp.getMes_File() == null) {
			mstemp.setMes_File("");
		}
		mesdao.savedMessage(mstemp);

		List<Message> MsList = mesdao.getChatedAll(mstemp.getMessangerRoom());

		// 에코 메시지를 브라우저에 보낸다.
		// 메시지 리스트를 주는것로 바꿔야한다.
		return MsList;

	}
	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수

	// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
	@OnError
	public void handleError(Throwable t) {
		// 콘솔에 에러를 표시한다.
		t.printStackTrace();
	}
}
