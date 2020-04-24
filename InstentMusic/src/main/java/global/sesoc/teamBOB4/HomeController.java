package global.sesoc.teamBOB4;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Customer;

@Controller
public class HomeController {
	
	@Autowired
	CustomerDao custdao;
	@Autowired
	PostDao postdao;
	final String savePath = "/profile";
	
	@GetMapping("temp")
	public String temp() {
		return "temp";
		
	}
	
	@GetMapping("/")
	public String index() {
		return "home";
	}

	@GetMapping("/home")
	public String home() {
		return "home";
	}

	@PostMapping("/login")
	public String login(Customer customer, boolean rememberMe,
			Model model, HttpServletResponse response,
			HttpSession session) {
		
		if(rememberMe) {
			Cookie cookie = new Cookie("savedId", customer.getCust_id());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("savedId", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		Customer c = custdao.selectOne(customer);
		
			
		
		if(c != null) {
			if(c.getCust_key().equals("Y")) {
			session.setAttribute("login", c.getCust_number());
			session.setAttribute("id", c.getCust_id());
			session.setAttribute("cust_number", c.getCust_number());
			session.setAttribute("nickname", c.getCust_nickname());
			session.setAttribute("introduce", c.getCust_introduce());
			session.setAttribute("image", c.getCust_photo_saved());
			return "main";
			}else {
				model.addAttribute("Error", "이메일인증해주세요");
				return "redirect:/";
			}
		}else {
			model.addAttribute("Error", "Typed down with wrong ID or Password");
			return "redirect:/";
		}
	}
	
	//must be linked with HTTP through the 'value=""'
	@GetMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}

	@GetMapping("/join")
	public String join() {
		return "customer/join";
	}

	@GetMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/musiclist")
	public String musiclist() {
		return "music/musiclist";
	}

	@GetMapping("/makingMusic")
	public String makingMusic() {
		return "music/makingMusic";
	}

	@GetMapping("/follow")
	public String follow() {
		return "customer/follow";
	}



	@GetMapping("/profile")
	public String profile(Model model,Customer customer) {
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
		customersData.setCust_number(24);
		int followers= 5030;
		int followings =150;
		List<Customer>list = custdao.searchList(customer);
		
		model.addAttribute("customersData", customersData);
		model.addAttribute("followers", followers);
		model.addAttribute("followings", followings);
		model.addAttribute("searchList", list);
		/* model.addAttribute("ListAll", ListAll); */
		// 이름, 이사람의 작성글 전체, 글로인한 숫자, 팔로워수 가져와기,필로잉수, 인트로
		// 글마다 좋아요나 재생수같은것도 가져와야함

		return "customer/profile";
	}

	/*
	 * @RequestMapping(value="/join", method = RequestMethod.POST) public String
	 * join(Customer customer,MultipartFile upload,RedirectAttributes rttr) {
	 * 
	 * String originalFilename = upload.getOriginalFilename(); String savedFilename
	 * = FileService.saveFile(upload, savePath);
	 * customer.setCust_photo_original(originalFilename);
	 * customer.setCust_photo_saved(savedFilename);
	 * 
	 * custdao.signup(customer);
	 * 
	 * return "redirect:home"; }
	 */
	@GetMapping("/deleteView")
	public String deletePage() {
		
		return "customer/withdrawal";
	}
	
	@PostMapping("/customerDelete")
	public String customerDelete(Customer customer,HttpSession session, RedirectAttributes rttr) {
		
		String sessionpwd = (String)session.getAttribute("password");
		
		String vopwd = customer.getCust_password();
		
		if(!(sessionpwd.equals(vopwd))) {
			rttr.addFlashAttribute("msg",false);
			return "redirect:/customer/withdrawal";
		}
		custdao.withdrawal(customer);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/goModify")
	public String goModify() {
		
		return "customer/modify";
	}
	@RequestMapping(value = "/goModify", method = RequestMethod.POST)
	public String updateCustomer(Customer customer,int cust_number, RedirectAttributes rttr, MultipartFile upload){
		
		Customer oldc = custdao.getNumber(cust_number);
		String savedfilename = oldc.getCust_photo_saved();
		if(savedfilename != null) {
			FileService.deleteFile(savePath+"/"+savedfilename);
		}
		String original = upload.getOriginalFilename();
		
		customer.setCust_photo_original(original);
		
		savedfilename = FileService.saveFile(upload, savePath);
		customer.setCust_photo_saved(savedfilename);
		
		custdao.updateCustomer(customer);
		
		return "redirect:/main";
	}
	
	@PostMapping("/change")
	public String changePwd(Customer customer, HttpSession session) {
		
		custdao.changePwd(customer);
		
		return "main";
	}
	@GetMapping("/protest")
	public String test() {
		
		return "customer/followlist";
	}
	
	@GetMapping("/followers")
	public String followers(Customer customer, Model model) {
		Customer c = custdao.selectOne(customer);
		List<Integer> followersList=custdao.getFollowers(c.getCust_number());
		
		model.addAttribute("followersList", followersList);
		
		return "customer/followers";
	}
	@GetMapping("/followings")
	public String followings(Customer customer, Model model) {
		Customer c = custdao.selectOne(customer);
		List<Integer> followingList=custdao.getFollowings(c.getCust_number());
		
		model.addAttribute("followingList", followingList);
		
		return "customer/followings";
	}
	@GetMapping("/test1")
	public String tesst1(Customer customer, Model model) {
		
		List<Customer>list = custdao.searchList(customer);
		String arr[] = new String[list.size()]; 
		for(int i=0; i<list.size();i++) {
			arr[i]=list.get(i).getCust_id();
		}
		model.addAttribute("arr", arr);
		model.addAttribute("search",list);
		
		return "test1";
	}
	@RequestMapping(value = "proDetail", method = RequestMethod.GET)
	public String proDetail(int cust_number, Model model) {
		// DB cust_number에대한 프로필 내용을 가져옴.
		Customer customer = custdao.getNumber(cust_number);
		
		model.addAttribute("pd", customer);
		
		return "customer/proDetail";
	}
	@GetMapping("/partmake")
	public String partmake(int part_number, int temp_bpm, Model model) {
		model.addAttribute("part_number", part_number);
		model.addAttribute("temp_bpm", temp_bpm);
		return "music/partmake";
	}
}
