package study.spring.selection.controllers;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.selection.model.Email;
import study.spring.selection.service.UserService;

@Controller
public class EmailController {
	@Autowired
	private UserService service;

	@Autowired
	private Email email;
	
	@RequestMapping(value="/Find_PW.do", method=RequestMethod.GET)
	public String Find_PW(){
		return "Find_PW";
	}
	
	@RequestMapping(value="/Send_PW.do", method=RequestMethod.GET)
	public String Send_PW(){
		return "Send_PW";
	}

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/searchPw.do", method=RequestMethod.GET)
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model, ModelAndView mv) throws Exception {

		String USERID = (String) paramMap.get("user_id");  
		String EMAIL = (String) paramMap.get("user_email");
		String PASSWORD = service.getPw(paramMap);
				
		if(PASSWORD!=null) {
			email.setContent("비밀번호는 "+PASSWORD+" 입니다."); // 이메일로 보낼 메시지
			email.setReceiver(EMAIL); // 받는이의 이메일 주소
			email.setSubject(USERID + "님 비밀번호 찾기 메일입니다."); // 이메일로 보낼 제목
			
			try {
				MimeMessage msg = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(msg, true, "UTF-8");
				
				messageHelper.setSubject(email.getSubject());
				messageHelper.setText(email.getContent());
				messageHelper.setTo(email.getReceiver());
				messageHelper.setFrom("jamie.leeyujung@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
				msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
				mailSender.send(msg);
				
			} catch(MessagingException e) {
				System.out.println("MessagingException");
				e.printStackTrace();
			}
			mv.setViewName("redirect:/Send_PW.do");
			return mv;
		} else {
			mv.setViewName("redirect:/PWCheck.do");
			return mv;
		}
	}
}
