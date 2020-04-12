package global.sesoc.teamBOB4;
 
import java.util.ArrayList;
import java.util.List;
 
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
 
import javax.websocket.RemoteEndpoint.Basic;
 
@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocketController {
    
	@OnOpen
	public void handleOpen() {
	// 콘솔에 접속 로그를 출력한다.
	System.out.println("client is now connected...");
	}
	// WebSocket으로 메시지가 오면 요청되는 함수
	/* @OnMessage */
	@GetMapping("/socketsend")
	public @ResponseBody String handleMessage(String userName,String userMessage) {
		
	// 메시지 내용을 콘솔에 출력한다.
	System.out.println("receive from client : " + userName+"!!!"+userMessage);
	// 에코 메시지를 작성한다.
	String replymessage = "echo " + userName+"!!!"+userMessage;
	// 에코 메시지를 콘솔에 출력한다.
	System.out.println("send to client : "+userName+"!!!"+userMessage);
	
	
	// 에코 메시지를 브라우저에 보낸다.
	return replymessage;
	}
	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose() {
	// 콘솔에 접속 끊김 로그를 출력한다.
	System.out.println("client is now disconnected...");
	}
	// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
	@OnError
	public void handleError(Throwable t) {
	// 콘솔에 에러를 표시한다.
	t.printStackTrace();
	}
	}


 


