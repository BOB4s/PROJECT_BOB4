package global.sesoc.teamBOB4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.vo.Follow;

@Controller
@RestController
public class CustomerController {

	@Autowired
	CustomerDao dao;

	
	@RequestMapping(value = "/following", method = RequestMethod.GET)
	public String follwing(int follower_number, int follow_number) {

		Follow follow = new Follow();
		follow.setFollow_number(follow_number);
		follow.setFollower_number(follower_number);

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
	
}
