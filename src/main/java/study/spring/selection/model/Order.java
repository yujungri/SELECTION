package study.spring.selection.model;

import lombok.Data;

@Data
public class Order {
	private String order_no;		// PK
	private int user_no;			// FK
	private String rec;				// 수령인
	private String postcode;	
	private String address;	
	private String address_detail;
	private int order_total;		// 총 금액
	private String order_status;	// default="입금대기"
	private String order_date;		// 주문 날짜
	

}
