package study.spring.selection.model;

import lombok.Data;

@Data
public class Qna {
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_type;
	private String reg_date;
	private String edit_date;
	private int user_no;
	
	// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
    private static int offset;
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Qna.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
    	Qna.listCount = listCount;
    }
}