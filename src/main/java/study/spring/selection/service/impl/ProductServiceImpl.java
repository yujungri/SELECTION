package study.spring.selection.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.selection.dao.ProductDao;
import study.spring.selection.model.Product;
import study.spring.selection.service.ProductService;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	@Autowired
	SqlSession sqlSession;

	/** 상품 목록 */
	@Override
	public List<Product> productList() {
		return dao.productList();
	}

	/** 상품 상세 */
	@Override
	public Product productDetail(int product_no) {
		return dao.productDetail(product_no);
	}

	/**
	 * Qna 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getProductCount(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ProductMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
	public int getProductAllCount(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ProductMapper.selectCountProductAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * Qna 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Product> getProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> getProductLowPriceList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectLowPriceList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> getProductHighPriceList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectHighPriceList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Object myHeartList(Map<String, Object> map) {
		return dao.productMyheart(map);
	}

	@Override
	public List<Product> getProductAllList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.ProductAllList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> getProductAllLowPriceList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectProductAllLowPriceList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> getProductAllHighPriceList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectProductAllHighPriceList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}