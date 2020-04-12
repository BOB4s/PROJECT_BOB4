package global.sesoc.teamBOB4.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("LoginInterceptor=====>");
		
		//세션의 로그인 정보를 알아냄
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			//로그인 화면으로 이동함!!!
			//context path를 뽑아냄
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath+"/home");
			return false;
		}
		
		return true;
	}
	
	
}
