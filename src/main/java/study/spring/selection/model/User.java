package study.spring.selection.model;

import lombok.Data;

@Data
public class User {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_tel;
	private String user_name;
	private String postcode;
	private String address;
	private String address_detail;
    private boolean useCookie;
    private String sessionkey;
    private String sessionlimit;
}