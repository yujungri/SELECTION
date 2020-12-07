package study.spring.selection.service;
import java.util.List;
import java.util.Map;

import study.spring.selection.model.Cart;
import study.spring.selection.model.Myheart;
public interface MyheartService {
	public List<Myheart> cartMoney();

	public void insert(Myheart myheart); // 장바구니 추가

	public List<Myheart> listMyheart(int user_no); // 장바구니 목록

	public void deleteMyheart(Myheart myheart) throws Exception; // 장바구니 삭제

	public void update(int myheart_no);

	public int countMyheart(int user_no, int product_no); // 장바구니 상품 갯수
	
	public void updateMyheart(Myheart myheart); //장바구니 수정

	public void delete(Map<String, Object> map);

	public int moveMyHeart(Cart input);
	
}
