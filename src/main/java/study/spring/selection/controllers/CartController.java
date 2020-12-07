package study.spring.selection.controllers;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.spring.selection.model.Cart;
import study.spring.selection.model.Order;
import study.spring.selection.model.OrderDetail;
import study.spring.selection.model.User;
import study.spring.selection.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	/** 장바구니 담기 */
	@RequestMapping(value="/cartInsert.do")
	public String insert(@ModelAttribute Cart cart,
			HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "Login";
		} 
		
		cart.setUser_no(user.getUser_no());
		int count = service.countCart(cart.getUser_no(), cart.getProduct_no());
		
		
		if (count == 0) {
			service.insert(cart);
		} else {
			service.updateCart(cart);
		}
		return "redirect:/cartList.do";
		
	}
	
	/** 장바구니 목록 */
	@RequestMapping(value="/cartList.do")
	public ModelAndView listCart(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		
		User user = (User) session.getAttribute("user");
		if(user != null) {
			List<Cart> list = service.listCart(user.getUser_no());
			map.put("list", list);
			map.put("count", list.size());
			
			mav.setViewName("ShoppingCart");
			mav.addObject("map", map);
			
			return mav;
		} else {
			return new ModelAndView("Login", "", null);
		}
	}
	
	/** 선택 상품 결제 페이지로 이동 */
	@ResponseBody
	@RequestMapping(value="/payList.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payList(ModelAndView mav,
			@RequestParam(value="chbox[]") List<String> checkArr) throws Exception {
		int cart_no = 0;
		List<Cart> list = new ArrayList<Cart>();
		for (String i : checkArr) {
			cart_no = Integer.parseInt(i);
			list.add(service.listPay(cart_no));
		}
		mav.addObject("list", list);
		mav.setViewName("Payment");
		
		return mav;
	}
	
	/** 주문 생성 */
	@RequestMapping(value = "/orderInsert.do", method = RequestMethod.POST)
	public String order(HttpSession session, Order order, OrderDetail orderDetail, Cart cart,
			@RequestParam(value="prodArr") List<String> prodArr,
			@RequestParam(value="cartArr") List<String> cartArr,
			@RequestParam(value="deliveryArr") List<String> deliveryArr) throws Exception {
		
		User user = (User) session.getAttribute("user");
		int user_no = user.getUser_no();
		
		/** 주문번호 난수 생성 */
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String year_str = Integer.toString(year).substring(2);
		String ym = year_str + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		char ch = (char) ((Math.random() * 26) + 65);
		String subNum = "";
		
		for (int i = 1; i <= 8; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		// ex) 200919P8002123
		
		/** 주문 생성 */
		String order_no = ymd + ch + subNum;
		order.setUser_no(user_no);
		order.setOrder_no(order_no);
		service.insertOrder(order);
		
		/** 주문 상세 생성 */
		orderDetail.setOrder_no(order_no);
		int product_no = 0;
		for(String i : prodArr) {
			product_no = Integer.parseInt(i);
			orderDetail.setProduct_no(product_no);
			service.insertOrderDetail(orderDetail);
		}

		/** 장바구니에서 삭제 */
		int cart_no = 0;
		cart.setUser_no(user_no);
		for(String i : cartArr) {
			cart_no = Integer.parseInt(i);
			cart.setCart_no(cart_no);
			service.deleteCart(cart);
		}
		
		return "redirect:/index.do";
	}
	
	/** 장바구니 삭제 */
	@ResponseBody
	@RequestMapping(value="/cartDelete.do", method=RequestMethod.POST)
	public int deleteCart(HttpSession session,
			@RequestParam(value="chbox[]") List<String> checkArr, Cart cart) throws Exception {
		
		User user = (User)session.getAttribute("user");
		int user_no = user.getUser_no();
		
		int result = 0;
		int cart_no = 0;
		
		if(user != null) {
			cart.setUser_no(user_no);
			
			for(String i : checkArr) {
				cart_no = Integer.parseInt(i);
				cart.setCart_no(cart_no);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}
	
	/** 결제 내역 조회 */
	@RequestMapping(value="/orderList.do", method=RequestMethod.GET)
	 public ModelAndView orderList(HttpSession session, ModelAndView mav, Order order) throws Exception {

		 User user = (User) session.getAttribute("user");
		 int user_no = user.getUser_no();
		 order.setUser_no(user_no);
		 
		 List<Order> orderOuter = service.orderOuter(order);
		 mav.addObject("outer", orderOuter);
		 mav.addObject("count", orderOuter.size());
		 
		 List<OrderDetail> orderInner = new ArrayList<OrderDetail>();
		 String order_no = null;
		 for(Order o : orderOuter) {
			 order_no = o.getOrder_no();
			 orderInner.addAll(service.orderInner(order_no));	 
		 }
		 mav.addObject("inner", orderInner);
		 mav.setViewName("Delivery");
		 return mav;	
	}
	
	/** 주문 취소 */
	@RequestMapping(value="/orderCancel.do", method=RequestMethod.POST)
		public String orderCancel(@RequestParam(value="order_no") String order_no,
								HttpSession session, Order order) throws Exception {
		User user = (User) session.getAttribute("user");
		int user_no = user.getUser_no();
		order.setUser_no(user_no);
		service.orderCancel(order);
		return "redirect:/orderList.do";
	}

}
