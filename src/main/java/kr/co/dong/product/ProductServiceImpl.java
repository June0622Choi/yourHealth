package kr.co.dong.product;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> getAllProducts() {
		return productDAO.selectAll();
	}
	
	@Override
	public ProductVO getDetail(int productId) {
		return productDAO.selectOne(productId);
	}
	
	@Override
	public int insertProduct(ProductVO product) {
		return productDAO.insert(product);
	}
	
	@Override
	public int updateProduct(ProductVO product) {
		return productDAO.update(product);
	}
	
	@Override
	public int deleteProduct(int productId) {
		return productDAO.delete(productId);
	}
}