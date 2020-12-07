package study.spring.selection.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.selection.dao.CartDao;
import study.spring.selection.model.Cart;
import study.spring.selection.model.Order;
import study.spring.selection.model.OrderDetail;
import study.spring.selection.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDao dao;
	
	/** 카트 생성 */
	@Override
	public void insert(Cart cart) {
		dao.insert(cart);
	}
	
	/** 카트 목록 */
	@Override
	public List<Cart> listCart(int user_no) {
		return dao.listCart(user_no);
	}
	
	/** 결제 페이지 목록 */
	@Override
	public Cart listPay(int cart_no) {
		return dao.listPay(cart_no);
	}
	
	/** 카트 삭제 */
	@Override
	public void deleteCart(Cart cart) throws Exception {
		dao.deleteCart(cart);
	}

	/** 동일한 상품인지 확인 */
	@Override
	public int countCart(int user_no, int product_no) {
		return dao.countCart(user_no, product_no);
	}
	
	/** 장바구니 동일상품 반영 */
	@Override
	public void updateCart(Cart cart) {
		dao.updateCart(cart);
	}
	
	/** 주문 생성 */
	@Override
	public void insertOrder(Order order) {
		dao.insertOrder(order);
	}
	
	/** 주문상세 생성 */
	@Override
	public void insertOrderDetail(OrderDetail orderDetail) {
		dao.insertOrderDetail(orderDetail);
		
	}
	
	/** 주문 내역 */
	@Override
	public List<Order> orderOuter(Order order) {
		return dao.orderOuter(order);
	}
	
	/** 주문상세 내역 */
	@Override
	public List<OrderDetail> orderInner(String order_no) {
		return dao.orderInner(order_no);
	}
	
	/** 주문 취소 */
	@Override
	public void orderCancel(Order order) {
		dao.orderCancel(order);
		
	}
	
}