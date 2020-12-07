package study.spring.selection.model;

import lombok.Data;

@Data
public class OrderDetail {
	
	// 주문
	private int order_detail_no;
	private String order_no;		
	private String rec;
	private String postcode;
	private String address;
	private String address_detail;
	private int order_total;
	private String order_status;
	private String order_date;
	
	// 주문 상세
	private int amount;				// 장바구니에 담은 개수
	private String delivery;		// 배송방법
	private String size;			// 사이즈
	private String color;			// 컬러
	
	// 상품
	private int product_no;
	private String product_name;    // 상품명
	private String product_brand;	// 브랜드
	private int product_price;		// 상품 가격
	private String product_img;		// 상품 이미지
}
