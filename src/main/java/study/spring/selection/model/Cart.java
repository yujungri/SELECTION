package study.spring.selection.model;

import lombok.Data;

@Data
public class Cart {
	private int cart_no;
	private int user_no;				// 참조키
	private int product_no;				// 참조키
	private int amount;					// 개수
	private String product_img;
	private String product_name;
	private String product_brand;
	private String product_content;
	private String size;				
	private String color;
	private String delivery;			// 배송방법(택배, 방문수령)
	private int product_price;
}	