package kr.co.dong.product;

import java.util.List;

public interface ProductService {
	List<ProductVO> getAllProducts();
	ProductVO getDetail(int productId);
	int insertProduct(ProductVO product);
	int updateProduct(ProductVO product);
	int deleteProduct(int productId);
}