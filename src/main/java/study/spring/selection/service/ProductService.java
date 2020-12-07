package study.spring.selection.service;

import java.util.List;
import java.util.Map;

import study.spring.selection.model.Product;

public interface ProductService {


	/** 상품 목록 */
	public List<Product> productList();

	/** 상품 상세 */
	public Product productDetail(int product_no);

	/**
	 * 상품 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getProductCount(Product input) throws Exception;
	
	public int getProductAllCount(Product input) throws Exception;

	public List<Product> getProductList(Product input) throws Exception;

	public List<Product> getProductLowPriceList(Product input) throws Exception;

	public List<Product> getProductHighPriceList(Product input) throws Exception;
	
	public List<Product> getProductAllList(Product input) throws Exception;
	
	public List<Product> getProductAllLowPriceList(Product input) throws Exception;

	public List<Product> getProductAllHighPriceList(Product input) throws Exception;

	/**마이하트용*/
	public Object myHeartList(Map<String, Object> map);
}