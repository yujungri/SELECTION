package study.spring.selection.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.spring.selection.dao.MyheartDao;
import study.spring.selection.model.Cart;
import study.spring.selection.model.Myheart;

@Repository
public class MyheartDaoImpl implements MyheartDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Myheart> myheartMoney() {

		return null;
	}

	@Override
	public void insert(Myheart myheart) {
		sqlSession.insert("MyheartMapper.insert", myheart);
	}

	@Override
	public List<Myheart> listMyheart(int user_no) {

		return sqlSession.selectList("MyheartMapper.listMyheart", user_no);
	}

	/*
	 * @Override public Myheart listPay(int myheart_no) { return
	 * sqlSession.selectList("MyheartMapper.listPay", myheart_no); }
	 */

	@Override
	public void deleteMyheart(Myheart myheart) throws Exception {
		sqlSession.delete("MyheartMapper.deleteMyheart", myheart);

	}

	

	/*
	 * @Override public int sumMoney(int user_no) { return 0; }
	 */

	@Override
	public int countMyheart(int user_no, int product_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_no", product_no);
		map.put("user_no", user_no);
		return sqlSession.selectOne("MyheartMapper.countMyheart", map);
	}

	@Override
	public void updateMyheart(Myheart myheart) {
		sqlSession.update("MyheartMapper.updateMyheart", myheart);

	}

	@Override
	public void modifyMyheart(Myheart myheart) {

	}
	
	@Override
	public void update(int myheart_no) {

	}

	@Override
	public void delete(Map<String, Object> map) {		
		sqlSession.delete("MyheartMapper.delete", map);
	}

	@Override
	public int moveMyHeart(Cart input) {
		return sqlSession.insert("MyheartMapper.moveMyHeart", input);
		
	}
	

}
