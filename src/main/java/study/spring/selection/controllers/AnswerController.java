package study.spring.selection.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.model.Answer;
import study.spring.selection.model.Qna;
import study.spring.selection.service.AnswerService;
import study.spring.selection.service.QnaService;

@Slf4j
@Controller
public class AnswerController {
	@Autowired
	AnswerService answerService;
	
	@Autowired
	QnaService qnaService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 작성 폼에 대한 action 페이지 */
    @RequestMapping(value = "/answer/add_ok.do", method = RequestMethod.POST)
    public void addOk(Model model, HttpServletResponse response,
            @RequestParam(value="answer_content") String answer_content, 
            @RequestParam(value="qna_no") int qna_no) {
        
        // 저장할 값들을 Beans에 담는다.
        Answer input = new Answer();
        input.setAnswer_content(answer_content);
        input.setAnswer_writer("SELECTION _운영팀 ");
        input.setQna_no(qna_no);
        
        Qna input1 = new Qna();
        input1.setQna_no(qna_no);
        input1.setQna_type("답변 완료");
        
        try {
            // 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            answerService.addAnswer(input);
        } catch (Exception e) { e.printStackTrace(); }

        try {
            // 데이터 수정
            qnaService.editQna(input1);
        } catch (Exception e) { e.printStackTrace(); }
        
        try {
            response.sendRedirect(contextPath + "/QnA.do");
        } catch (IOException e) { e.printStackTrace(); }

    }
    
    /** 작성 폼에 대한 action 페이지 */
    @RequestMapping(value = "/answer/delete_ok.do", method = RequestMethod.GET)
    public void deleteOk(Model model, HttpServletResponse response,
            @RequestParam(value="answer_no") int answer_no) {
        
        // 저장할 값들을 Beans에 담는다.
        Answer input = new Answer();
        input.setAnswer_no(answer_no); 
        
        try {
            // 데이터 삭제
            answerService.deleteAnswer(input);
        } catch (Exception e) { e.printStackTrace(); }

        try {
            response.sendRedirect(contextPath + "/QnA.do");
        } catch (IOException e) { e.printStackTrace(); }

    }
}
