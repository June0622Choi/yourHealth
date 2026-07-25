package kr.co.dong.product;

import java.util.List;

public interface ProductDAO {

	List<ProductVO>selectAll();
	ProductVO selectOne(int productId);
	int insert(ProductVO product);
	int update(ProductVO prodcut);
	int delete(int productId);
}
