
package global.sesoc.teamBOB4.mailutil;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import global.sesoc.teamBOB4.dao.CustomerMapper;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private SqlSessionTemplate sqlSession;
	private CustomerMapper userDao;
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String e_mail, String cust_id, HttpServletRequest request) {
		
		String cust_key = getKey(false, 20);
		System.out.println(cust_key);
		System.out.println(cust_id);
		userDao = sqlSession.getMapper(CustomerMapper.class);
		
		Map <String , Object> map = new HashMap<>();
		map.put("cust_id", cust_id);
		map.put("cust_key", cust_key);
		System.out.println(map.get("cust_id"));
		System.out.println(map.get("cust_key"));
		int a=userDao.GetKey(map); 
		System.out.println(a);
		MimeMessage mail = mailSender.createMimeMessage(); 
		String htmlStr = "<h2>IM 회원가입을 환영합니다. </h2><br><br>" 
				+ "<h3>" + cust_id + "님 인증을 마치시려면 다음을 입력해주세요</h3>" + "<br><p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다.<br> " 
				+ "<a href='http://localhost:8888" + request.getContextPath() + "/user/key_alter?cust_id="+ cust_id +"&cust_key="+cust_key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] 계정 확인해주세요 !", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		// 아마존 주소 : http://54.180.117.142/MS/user/key_alter?user_id=
		
	}
	public int alter_userKey_service(String cust_id, String cust_key) {
		
		int resultCnt = 0;
		userDao = sqlSession.getMapper(CustomerMapper.class);
		resultCnt = userDao.alter_userKey(cust_id, cust_key);
		
		return resultCnt;
	}
}
