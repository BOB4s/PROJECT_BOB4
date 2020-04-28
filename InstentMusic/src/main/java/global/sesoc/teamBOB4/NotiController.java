
package global.sesoc.teamBOB4;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.dao.NotiDao;
import global.sesoc.teamBOB4.dao.PostDao;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.vo.Notification2;
import global.sesoc.teamBOB4.vo.Post;

@Controller
public class NotiController {

	@Autowired
	NotiDao notidao;
	@Autowired
	CustomerDao custdao;
	@Autowired
	PostDao postdao;

	@RequestMapping(value = "/noti_save", method = RequestMethod.GET)
	public @ResponseBody void noti_save(Notification2 noti) {
	

		notidao.save_new_noti(noti);
	}

	@RequestMapping(value = "/noti_getBycust_number", method = RequestMethod.GET)
	public @ResponseBody List<Notification2> noti_getBycust_number(HttpSession session) {
		int cust_number = (int) session.getAttribute("login");

		List<Notification2> notiList = notidao.getnewnotisBycust_number(cust_number);
		for (int i = 0; i < notiList.size(); i++) {
			int cust_number1 = notiList.get(i).getNot_sender_number();
			Customer cust_profile = custdao.searchOne_ByCustnumber_getProfile(cust_number1);
			System.out.println(cust_profile.toString());
			notiList.get(i).setNot_nickname(cust_profile.getCust_nickname());
			notiList.get(i).setNot_savedData(cust_profile.getCust_photo_saved());

			if (notiList.get(i).getNot_type().equals("POST")) {
				String tempData =  notiList.get(i).getNot_content();
				int mus_number = Integer.parseInt(tempData);
				Post p = new Post();
				p.setMus_number(mus_number);
				Post posts=	postdao.getPostByPostNum(postdao.getOneByMus_number(p));
				tempData = notiList.get(i).getNot_nickname()+"님이"+posts.getMus_title()+"을 업로드하였습니다.";
				int cust_number2 = notiList.get(i).getNot_sender_number();
				String aTeg2 = "<a href ='proDetail?cust_number="+ cust_number2+"'>"+notiList.get(i).getNot_nickname();
				String aTeg = "<a href ='postGetOne?post_number="+ posts.getPost_number()+"'>"+	posts.getMus_title()+"</a>";
				tempData = aTeg2 +"님이"+aTeg+"을 업로드하였습니다.";
				tempData = notiList.get(i).getNot_nickname()+"님이"+posts.getMus_title()+"을 업로드하였습니다.";
				
				notiList.get(i).setNot_content(tempData);
				
			}
			else if (notiList.get(i).getNot_type().equals("CHAT")) {
				notiList.get(i).setNot_content(notiList.get(i).getNot_content()+"에게 새 매세지");
			}

			else if (notiList.get(i).getNot_type().equals("Reply")) {
				String tempData =  notiList.get(i).getNot_content();
				int post_number = Integer.parseInt(tempData);
				Post posts=	postdao.getPostByPostNum(post_number);
				int cust_number2 = notiList.get(i).getNot_sender_number();
				String aTeg2 = "<a href ='proDetail?cust_number="+ cust_number2+"'>"+notiList.get(i).getNot_nickname();
				String aTeg = "<a href ='postGetOne?post_number="+ post_number+"'>"+	posts.getMus_title()+"</a>";
				tempData = aTeg2 +"님이"+aTeg+"에 새로운 댓글을 달았습니다.";
				
				
				notiList.get(i).setNot_content(tempData);
			}
			else if (notiList.get(i).getNot_type().equals("Follow")) {
				int cust_number2 =custdao.get_cust_number_by_nickname(notiList.get(i).getNot_content());
			String aTeg = " <a href ='proDetail?cust_number="+ cust_number2+"'>"+	notiList.get(i).getNot_content();
				
				String tempData =  aTeg+"</a> 님이 회원님을 팔로우하기 시작하였습니다";
			notiList.get(i).setNot_content(tempData);
			}
		}

		return notiList;
	}

}
