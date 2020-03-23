package global.sesoc.teamBOB4;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import global.sesoc.teamBOB4.vo.Customer;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String index() {
		return "home";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "customer/login";
	}
	
	@GetMapping("/join")
	public String join() {
		return "customer/join";
	}

	@GetMapping("/main")
	public String main(Customer customer, HttpSession session) {
		session.setAttribute("login", customer.getCust_number());
		return "main";
	}
	
	@GetMapping("/musicmake")
	public String musicmake() {
		return "music/musicmake";
	}
	@GetMapping("/follow")
	public String follow() {
		return "customer/follow";
	}
	
}
