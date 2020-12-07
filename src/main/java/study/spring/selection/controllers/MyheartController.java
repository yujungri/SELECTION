package study.spring.selection.controllers;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Value;

import study.spring.selection.helper.PageData;
import study.spring.selection.model.Cart;
import study.spring.selection.model.Myheart;
import study.spring.selection.model.User;
import study.spring.selection.service.MyheartService;

@Controller
public class MyheartController {
	@Autowired
	MyheartService service;

	/**
	 * 마이하트 찜하기
	 * 
	 * @param product_no
	 * @param user_no
	 */
	@ResponseBody
	@RequestMapping(value = "/myheartInsert.do")
	// requestParam하면 화면에서 올려준 모든 데이터를 받아올수 있어
	public String insert(@RequestParam Map<String, Object> reqParam, @ModelAttribute Myheart myheart,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		Map<String, Object> map = new HashMap<>();

		if (user == null) {
			return "Login";
		}

		String setHeartVal = reqParam.get("setHeartVal").toString();

		// null 이면 체크(insert), null이 아니면(delete) 해제
		if (setHeartVal.equals("1")) { // Object, String Type 비교시 equals 사용, == 비교불가
			myheart.setUser_no(user.getUser_no());
			service.insert(myheart);

		} else {
			int user_no = user.getUser_no();
			int product_no = Integer.parseInt(reqParam.get("product_no").toString());

			map.put("user_no", user_no);
			map.put("product_no", product_no);
			service.delete(map);
		}

		return setHeartVal;
	}

	/** 마이하트 목록 */
	@RequestMapping(value = "/myHeartList.do")
	public ModelAndView listMyheart(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();

		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			mav.setViewName("Login");
		} 

		List<Myheart> list = service.listMyheart(user.getUser_no());
		map.put("list", list);
		map.put("count", list.size());

		mav.setViewName("MyHeart");
		mav.addObject("map", map);

		return mav;
	}

	/** 마이하트 삭제 */
	@ResponseBody
	@RequestMapping(value = "/myheartDelete.do", method = RequestMethod.POST)
	public int deleteMyheart(HttpSession session, @RequestParam(value = "chbox[]") List<String> checkArr,
			Myheart myheart) throws Exception {

		User user = (User) session.getAttribute("user");
		int user_no = user.getUser_no();

		int result = 0;
		int myheart_no = 0;

		if (user != null) {
			myheart.setUser_no(user_no);

			for (String i : checkArr) {
				myheart_no = Integer.parseInt(i);
				myheart.setMyheart_no(myheart_no);
				service.deleteMyheart(myheart);
			}
			result = 1;
		}
		return result;
	}

	/** 마이하트 장바구니 이동 */
	@ResponseBody
	@RequestMapping(value = "/moveMyHeart.do", method = RequestMethod.POST)
	public int moveMyheart(HttpSession session, @RequestParam Map<String, Object> data) throws Exception {

		User user = (User) session.getAttribute("user");
		int user_no = user.getUser_no();
		Cart input = new Cart();
		Myheart myheart = new Myheart();

		int result = 0;
		int myheart_no = 0;
		
		// input 받은 값을 카트에 담아야함.
		result = service.moveMyHeart(input);
		
		if(user != null) { 
			myheart.setUser_no(user_no);
			
			myheart.setMyheart_no(myheart_no); 
		
			if(result == 1){
				service.deleteMyheart(myheart); 
			} 
			
		}
		return result;
	}

}
