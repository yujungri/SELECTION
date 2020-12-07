package study.spring.selection.dao;

import java.util.List;
import java.util.Map;

import study.spring.selection.model.Product;

public interface ProductDao {
	
	/**  */
	public List<Product> productList();
	
	/**  */
	public Product productDetail(int product_no);
	
	public Object productMyheart(Map<String, Object> map);
}
