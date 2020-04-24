package global.sesoc.teamBOB4;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.teamBOB4.util.FileService;
import global.sesoc.teamBOB4.vo.Customer;
import global.sesoc.teamBOB4.dao.CustomerDao;
import global.sesoc.teamBOB4.mailutil.MailSendService;

@Controller
public class mailController {
	@Autowired
	private MailSendService mailsender;
	@Autowired
	CustomerDao dao;
	final String savePath = "/profile";


	// 회원가입 컨트롤러
	@RequestMapping(value = "/cust_join_byemail", method = RequestMethod.POST)
	public String userRegPass(Customer customer,MultipartFile upload,Model model, HttpServletRequest request) {
		// 회원가입 메서드
		String originalFilename = upload.getOriginalFilename();
		String savedFilename = FileService.saveFile(upload, savePath);
		customer.setCust_photo_original(originalFilename);
		customer.setCust_photo_saved(savedFilename);

		dao.signup(customer);
		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(customer.getCust_email(), customer.getCust_id(), request);

		return "redirect:/";
	}

	@RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("cust_id") String cust_id, @RequestParam("cust_key") String cust_key) {

		mailsender.alter_userKey_service(cust_id, cust_key); // mailsender의 경우 @Autowired

		return "/emails/regSuccess";
	}
}
