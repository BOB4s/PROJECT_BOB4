package global.sesoc.teamBOB4;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.vo.Follow;

@RestController
@Controller
public class CustomerController {

	@Autowired
	CustomerDao dao;

	@RequestMapping(value = "/following", method = RequestMethod.GET)
	public String follwing(int follower_number, int follow_number) {

		Follow follow = new Follow();
		follow.setFollow_number(follow_number);
		follow.setFollower_number(follower_number);
		System.out.println(follow.toString());
		int result =dao.checkfollow(follow);
		if (result == 0) {
			 dao.following(follow);
			 System.out.println("삽입");
			return "followed";
		}
		 dao.unfollowing(follow);
		 System.out.println("삭제");
		return "unfollowed";
	
	}
	@RequestMapping(value = "/followchecking", method = RequestMethod.GET)
	public String followchecking(int follower_number, int follow_number) {

		Follow follow = new Follow();
		follow.setFollow_number(follow_number);
		follow.setFollower_number(follower_number);

		int result =dao.checkfollow(follow);
		if (result == 0) 
			return "unfollowed";
		if(result == 1) 
		return "followed";
		
		return "";
	}
	@RequestMapping(value = "/getFollowers", method = RequestMethod.GET)
	public String getFollowers(int follow_number,Model model) {

		List<Integer> fList = dao.getFollowers(follow_number);
		
		
		model.addAttribute("fList", fList);
		return "success";
	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheck(Customer customer) {
		
		Customer c = dao.selectOne(customer);
		
		if(c == null) {
			return "success";
		}
		return "fail";
	}
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	public String useremailCheck(Customer customer) {
		Customer c = dao.selectEmail(customer);

		if (c == null) {
			return "success";
		}
		return "fail";
	}

	@RequestMapping(value = "/toSendIsCorrect", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String toSendIsCorrect(String sendData) {
		String reciver =dao.getDataFromDBsendData(sendData);
		
	return reciver;
		
	}
	
	@GetMapping("/searchpf")
	public List<Customer> searchpf(String search){
		
		return dao.searchpf(search);
	}
	

}
