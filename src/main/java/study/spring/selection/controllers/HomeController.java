package study.spring.selection.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.selection.model.Myheart;
import study.spring.selection.model.Order;
import study.spring.selection.model.User;
import study.spring.selection.service.CartService;
import study.spring.selection.service.MyheartService;

@Controller
public class HomeController {
	
	@Autowired
	CartService cartService;
	@Autowired
	MyheartService myheartService;

    @RequestMapping(value = "/")
    public String home() {

        return "index";
    }

    @RequestMapping(value = "/index.do")
    public String index() {

        return "index";
    }

    @RequestMapping(value = "/Login.do", method = RequestMethod.GET)
    public String Login() {

        return "Login";
    }

    @RequestMapping(value = "/SignUp.do")
    public String signUp() {

        return "SignUp";
    }

    @RequestMapping(value = "/Update_Info.do")
    public String update_info() {

        return "Update_Info";
    }

    @RequestMapping(value = "/Find_ID.do")
    public String Find_Id() {

        return "Find_ID";
    }

    @RequestMapping(value = "/Search_ID.do")
    public String Search_ID() {

        return "Search_ID";
    }

    @RequestMapping(value = "/FindByEmail.do")
    public String FindByEmail() {

        return "FindByEmail";
    }
    
	@RequestMapping(value="/MyPage.do", method=RequestMethod.GET)
	 public ModelAndView orderList(HttpSession session, ModelAndView mav, Order order) throws Exception {

		 User user = (User) session.getAttribute("user");
		 int user_no = user.getUser_no();
		 order.setUser_no(user_no);
		 
		 List<Order> orderOuter = cartService.orderOuter(order);
		 List<Myheart> list = myheartService.listMyheart(user.getUser_no());
		 mav.addObject("outer", orderOuter);
		 mav.addObject("count", list.size());
		 mav.setViewName("MyPage");
		 return mav;
	}

    @RequestMapping(value = "/Check_PW.do")
    public String Check_PW() {

        return "Check_PW";
    }

    @RequestMapping(value = "/ready.do")
    public String ready() {

        return "ready";
    }

    /** 카테고리 바 시작 */

    @RequestMapping(value = "/Best.do")
    public String Best() {

        return "Best";
    }

    @RequestMapping(value = "/New.do")
    public String New() {

        return "New";
    }

    @RequestMapping(value = "/Recommend.do")
    public String Reccomend() {

        return "Recommend";
    }

    @RequestMapping(value = "/Top.do")
    public String Top() {

        return "Top";
    }

    @RequestMapping(value = "/Dress.do")
    public String Dress() {

        return "Dress";
    }

    @RequestMapping(value = "/Pants.do")
    public String Pants() {

        return "Pants";
    }

    @RequestMapping(value = "/Outer.do")
    public String Outer() {

        return "Outer";
    }

    @RequestMapping(value = "/Acc.do")
    public String Acc() {

        return "Acc";
    }

    @RequestMapping(value = "/Announcement.do")
    public String Announcement() {

        return "Announcement";
    }
    /** 카테고리 바 끝 */

    /** footer 시작 */
    @RequestMapping(value = "/CustomerService.do")
    public String CustomerService() {

        return "CustomerService";
    }

    @RequestMapping(value = "/Store_Info.do")
    public String Store_Info() {

        return "Store_Info";
    }

    @RequestMapping(value = "/Staff.do")
    public String Staff() {

        return "Staff";
    }
    /** footer 끝 */
}