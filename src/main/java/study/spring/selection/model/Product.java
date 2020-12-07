package study.spring.selection.model;

import lombok.Data;

@Data
public class Product {
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_content;
	private String product_brand;
	private String product_category;
	private String product_img;
	
	// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;	// LIMIT 절에서 사용할 검색 시작 위치
    private static int listCount;	// LIMIT 절에서 사용할 검색할 데이터 수

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Product.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
    	Product.listCount = listCount;
    }
}