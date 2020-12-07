package study.spring.selection.service;

import java.util.List;

import study.spring.selection.model.Cart;
import study.spring.selection.model.Order;
import study.spring.selection.model.OrderDetail;

public interface CartService {
	public void insert(Cart cart); //장바구니 추가
	public List<Cart> listCart(int user_no); //장바구니 목록
	public Cart listPay(int cart_no); //결제 페이지 목록
	public void deleteCart(Cart cart) throws Exception; //장바구니 비우기
	public int countCart(int user_no, int product_no); //장바구니 상품 갯수
	public void updateCart(Cart cart); //장바구니 수정 
	
	public void insertOrder(Order order); // 주문 생성
	public void insertOrderDetail(OrderDetail orderDetail); // 주문상세 생성
	
	public List<Order> orderOuter(Order order); // 주문 내역
	public List<OrderDetail> orderInner(String order_no); // 주문상세 내역
	
	public void orderCancel(Order order);	// 주문 취소
}
