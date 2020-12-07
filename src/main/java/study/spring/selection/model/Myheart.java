package study.spring.selection.model;

import lombok.Data;

@Data
public class Myheart {
	private int myheart_no;
	private int user_no;				// 참조키
	private int product_no;
	private String product_img;
	private String product_name;
	private String product_brand;
	private int product_price;
	
 // 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Myheart.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
    	Myheart.listCount = listCount;
    }
}
