package study.spring.selection.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.beans.factory.annotation.Value;
import lombok.extern.slf4j.Slf4j;
import study.spring.selection.helper.PageData;
import study.spring.selection.model.Answer;
import study.spring.selection.model.Qna;
import study.spring.selection.service.AnswerService;
import study.spring.selection.service.QnaService;

@Slf4j
@Controller
public class QnaController {
	@Autowired 
	QnaService qnaService;
	
	@Autowired
	AnswerService answerService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	 /** 목록 페이지 */
    @RequestMapping(value = "/QnA.do", method = RequestMethod.GET)
    public String list(Model model, HttpServletResponse response,
            // 페이지 구현에서 사용할 현재 페이지 번호
            @RequestParam(value="page", defaultValue="1") int nowPage) {
        
        int totalCount = 0;        // 전체 게시글 수
        int listCount  = 4;        // 한 페이지당 표시할 목록 수
        int pageCount  = 5;        // 한 그룹당 표시할 페이지 번호 수
        
        // 조회에 필요한 조건값(검색어)를 Beans에 담는다.
        Qna input = new Qna();
        
        List<Qna> output = null;		// 조회결과가 저장될 객체
        PageData pageData = null;		// 페이지 번호를 계산한 결과가 저장될 객체
        
        List<Answer> output1 = null;
        
        try {
        	output1 = answerService.getAnswerList(null);
        } catch (Exception e) { e.printStackTrace(); }
        
        
        try {
            // 전체 게시글 수 조회
            totalCount = qnaService.getQnaCount(input);
            // 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
            pageData = new PageData(nowPage, totalCount, listCount, pageCount);

            // SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
            Qna.setOffset(pageData.getOffset());
            Qna.setListCount(pageData.getListCount());
            
            // 데이터 조회하기
            output = qnaService.getQnaList(input);
        } catch (Exception e) { e.printStackTrace(); }

        // View 처리
        model.addAttribute("output", output);
        model.addAttribute("output1", output1);
        model.addAttribute("pageData", pageData);
        return "QnA";
    }

    /** 작성 폼 페이지 */
    @RequestMapping(value = "/Write_QnA.do", method = RequestMethod.GET)
    public String add(Model model, HttpServletResponse response) {
        return "Write_QnA";
    }

    /** 작성 폼에 대한 action 페이지 */
    @RequestMapping(value = "/qna/add_ok.do", method = RequestMethod.POST)
    public void addOk(Model model, HttpServletResponse response,
            @RequestParam(value="qna_title") String qna_title,
            @RequestParam(value="qna_content") String qna_content,
            @RequestParam(value="user_no") int user_no) {
        
        // 저장할 값들을 Beans에 담는다.
        Qna input = new Qna();
        input.setQna_title(qna_title);
        input.setQna_content(qna_content);
        input.setUser_no(user_no);
        input.setQna_type("답변대기");
        
        try {
            // 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            qnaService.addQna(input);
        } catch (Exception e) { e.printStackTrace(); }

        try {
            response.sendRedirect(contextPath + "/QnA.do");
        } catch (IOException e) { e.printStackTrace(); }

    }

    /** 삭제 처리 구현 */
    @RequestMapping(value = "/qna/delete_ok.do", method = RequestMethod.GET)
    public void deleteOk(Model model, HttpServletResponse response,
            @RequestParam(value="qna_no") int qna_no) {
        // 데이터 삭제에 필요한 조건값을 Beans에 저장하기
        Qna input = new Qna();
        input.setQna_no(qna_no);

        try {
            // 데이터 삭제
            qnaService.deleteQna(input);
        } catch (Exception e) { e.printStackTrace(); }

        // 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
        try {
            response.sendRedirect(contextPath + "/QnA.do");
        } catch (IOException e) { e.printStackTrace(); }
    }
}