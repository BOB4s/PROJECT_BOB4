	
package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.ReplyDao;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Reply;

@RestController
public class ReplyController {

	@Autowired
	ReplyDao dao;
	
	@Autowired
	CustomerDao cdao;
	
	final String savePath = "/profile";

	@PostMapping("/replyWrite")
	public String replyWrite(Reply reply, HttpSession session) {
		String rep_nickname = (String) session.getAttribute("nickname");
		reply.setRep_nickname(rep_nickname);
		
		System.out.println(reply);
		int result = dao.writeReply(reply);
		if (result == 1)
			return "success";
		return "fault";
	}

	@PostMapping("/replyUpdate")
	public String replyUpdate(Reply reply, HttpSession session) {
		String rep_nickname = (String) session.getAttribute("nickname");
		reply.setRep_nickname(rep_nickname);

		int result = dao.modifyReply(reply);

		if (result == 1)
			return "success";

		return "fault";
	}

	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public String replyDelete(int rep_number, int post_number) {

		int result = dao.deleteReply(rep_number, post_number);
		if (result == 1) {
			return "success";
		}
		return "fault";
	}

	@RequestMapping(value = "/replyAll", method = RequestMethod.GET)
	public List<Reply> replyList(int post_number) {
		List<Reply> replyList = dao.replyList(post_number);
		for(Reply r : replyList) {
			int cust = r.getCust_number();
			Customer c = new Customer();
			c.setCust_number(cust);
			Customer result = cdao.searchOne(c);
			String path = result.getCust_photo_saved();
			r.setCust_photo(path);
		}

		return replyList;
	}

}
