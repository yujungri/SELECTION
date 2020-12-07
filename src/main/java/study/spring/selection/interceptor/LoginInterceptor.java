package study.spring.selection.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.model.User;
import study.spring.selection.service.UserService;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	UserService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 객체를 가져옴
		HttpSession session = request.getSession();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				log.debug("자동로그인 실행됨");
				String sessionId = loginCookie.getValue();
				User login = service.checkUserSessionKey(sessionId);

				if (login != null) {
					session.setAttribute("user", login);
					return true;
				}
			}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("AppInterceptor.postHandle 실행됨");
		super.postHandle(request, response, handler, modelAndView);
	}

}
