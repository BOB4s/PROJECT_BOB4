package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Post;

@Controller
public class HomeController {

	@Autowired
	CustomerDao custdao;
	@Autowired
	PostDao postdao;
	
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

	@GetMapping("/profile")
	public String profile(Model model) {
		//닉네임으로 원하는값 찾기
		// profile 에 파라미터로  >>> String cust_nickname, 를넣고 아래의
		// 회원가입 만들어지면 주석 풀면됩니다.
		/*Customer customersData =custdao.searchOne(cust_nickname);
		int cust_number =customersData.getCust_number();
		List<Integer> followersList=custdao.getFollowers(cust_number);
		int followers=followersList.size();
		List<Integer> followingList=custdao.getFollowings(cust_number);
		int followings=followingList.size();
		List<Post> ListAll =  postdao.getAll(cust_number);*/
		
		
		
		
		
		Customer customersData = new Customer();
		customersData.setCust_introduce("이지은입니다");
		customersData.setCust_nickname("IU");
		customersData.setCust_number(123);
		int followers= 5030;
		int followings =150;
		
		model.addAttribute("customersData", customersData);
		model.addAttribute("followers", followers);
		model.addAttribute("followings", followings);
		/* model.addAttribute("ListAll", ListAll); */
		// 이름, 이사람의 작성글 전체, 글로인한 숫자, 팔로워수 가져와기,필로잉수, 인트로
		// 글마다 좋아요나 재생수같은것도 가져와야함

		return "customer/profile";
	}
}
