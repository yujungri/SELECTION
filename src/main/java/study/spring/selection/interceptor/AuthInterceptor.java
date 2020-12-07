
package study.spring.selection.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import lombok.extern.slf4j.Slf4j;
import study.spring.selection.service.UserService;

@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	UserService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login 처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("user");

		if (obj == null) {
			log.debug("로그인이 안된 상태입니다.");

			// 로그인이 안돼있는 상태이므로 로그인 폼으로 다시 돌려보냄
			response.sendRedirect("/selection/Login.do");
			return false;
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
