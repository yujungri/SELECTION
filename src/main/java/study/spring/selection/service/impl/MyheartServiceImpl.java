package study.spring.selection.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.dao.MyheartDao;
import study.spring.selection.model.Cart;
import study.spring.selection.model.Myheart;
import study.spring.selection.service.MyheartService;

@Slf4j
@Service
public class MyheartServiceImpl implements MyheartService {
	@Autowired
	MyheartDao dao;

	@Override
	public List<Myheart> cartMoney() {

		return null;
	}

	/** 결제 페이지 목록 */
	/*
	 * @Override public Myheart listPay(int myheart_no) { // TODO Auto-generated
	 * method stub return dao.listPay(myheart_no); }
	 */

	@Override
	public void insert(Myheart myheart) {
		dao.insert(myheart);

	}

	@Override
	public List<Myheart> listMyheart(int user_no) {
		return dao.listMyheart(user_no);
	}

	@Override
	public void deleteMyheart(Myheart myheart) throws Exception {
		dao.deleteMyheart(myheart);

	}

	@Override
	public void update(int myheart_no) {

	}

	/*
	 * @Override public int sumMoney(int user_no) { return dao.sumMoney(user_no); }
	 */

	/** 동일한 상품인지 확인 */
	@Override
	public int countMyheart(int user_no, int product_no) {

		return dao.countMyheart(user_no, product_no);
	}

	@Override
	public void updateMyheart(Myheart myheart) {
		dao.updateMyheart(myheart);

	}

	@Override
	public void delete(Map<String, Object> map) {
		dao.delete(map);
		
	}

	@Override
	public int moveMyHeart(Cart input) {
		int result = 0;
		
		return result;	
	}
	

}