package study.spring.selection.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import study.spring.selection.dao.ProductDao;
import study.spring.selection.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	SqlSession sqlSession;
	
	/** 상품 목록 */
	@Override
	public List<Product> productList() {
		return sqlSession.selectList("ProductMapper.productList");
	}
	
	/** 상품 상세 */
	@Override
	public Product productDetail(int product_no) {
		return sqlSession.selectOne("ProductMapper.productDetail", product_no);
	}
	
	@Override
	public Object productMyheart(Map<String, Object> map) {
		return sqlSession.selectOne("ProductMapper.productMyheart", map);
	}
}
	

