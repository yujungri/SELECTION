package study.spring.selection.controllers;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.model.User;
import study.spring.selection.service.UserService;

@Slf4j
@Controller
public class UserController {

	@Autowired
	UserService service;

	/** 회원가입 */
	@RequestMapping(value = "/UserRegister.do", method = RequestMethod.POST)
	public String register(User user) throws Exception {
		service.register(user);
		return "redirect:/index.do";
	}

	/** 로그인 */
	@RequestMapping(value = "/UserLogin.do", method = RequestMethod.POST)
	public void login(User user, HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		if (session.getAttribute("user") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("user");// 기존값을 제거해 준다.
		}

		User login = service.login(user);

		if (login != null) { // 로그인 성공
			log.debug("로그인 성공");

			if (user.isUseCookie()) {
				Cookie cookie = new Cookie("loginCookie", session.getId());
				cookie.setPath("/");
				int amount = 60 * 60 * 24 * 7;
				cookie.setMaxAge(amount);
				response.addCookie(cookie);

				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				service.keepLogin(login.getUser_id(), session.getId(), sessionLimit);
			}
			session.setAttribute("user", login); // 세션에 login이란 이름으로 User객체를 저장
			response.getWriter().print(true);
		} else {
			log.debug("로그인 실패");
			session.setAttribute("user", null);
			response.getWriter().print(false);
		}
	}

	/** 아이디 중복체크 */
	@ResponseBody
	@RequestMapping(value = "/IdCheck.do", method = RequestMethod.POST)
	public int idCheck(User user) throws Exception {
		int result = service.idCheck(user);
		return result;
	}

	/** 로그아웃 */
	@RequestMapping(value = "/UserLogout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Object obj = session.getAttribute("user");
		if (obj != null) {
			User login = (User) obj;

			session.removeAttribute("user");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);

				Date date = new Date(System.currentTimeMillis());
				service.keepLogin(login.getUser_id(), session.getId(), date);
			}
		}
		return "redirect:/index.do";
	}

	/** 회원정보수정 */
	@RequestMapping(value = "/UserUpdate.do", method = RequestMethod.POST)
	public String userUpdate(User user, HttpSession session) throws Exception {

		service.userUpdate(user);
		session.invalidate();
		return "Login";
	}

	/** 회원탈퇴 */
	@RequestMapping(value = "/UserDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String userDelete(User user, HttpSession session) throws Exception {

		User user1 = (User) session.getAttribute("user");

		service.userDelete(user1);
		session.invalidate();

		return "redirect:/index.do";
	}

	/** 탈퇴 시 비밀번호 확인 */
	@ResponseBody
	@RequestMapping(value = "/checkPW.do", method = RequestMethod.POST)
	public int checkPW(User user) throws Exception {
		int result = service.checkPW(user);
		return result;
	}

	/** 아이디 찾기 */
	@RequestMapping(value = "/FindID.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String findID(Model model, HttpServletResponse response,
			@RequestParam(value = "user_email", required = true) String user_email) {

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		User user1 = new User();
		user1.setUser_email(user_email);

		// 조회결과를 저장할 객체 선언
		User output = null;

		try {
			// 데이터 조회
			output = service.findID(user1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		return "Search_ID";
	}

	/** 아이디찾기 이메일 존재여부 체크 */
	@ResponseBody
	@RequestMapping(value = "/EmailCheck.do", method = RequestMethod.POST)
	public int emailCheck(User user) throws Exception {
		int result = service.emailCheck(user);
		return result;
	}

	/** 비밀번호 찾기 회원정보 존재여부 체크 */
	@ResponseBody
	@RequestMapping(value = "/PWCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int pwCheck(User user) throws Exception {
		int result = service.pwCheck(user);
		return result;
	}

}