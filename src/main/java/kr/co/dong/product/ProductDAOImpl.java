package kr.co.dong.product;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public List<ProductVO> selectAll() {
        return sqlSession.selectList("kr.co.dong.product.ProductMapper.selectAll");
    }
    
    @Override
    public ProductVO selectOne(int productId) {
        return sqlSession.selectOne("kr.co.dong.product.ProductMapper.selectOne", productId);
    }
    
    @Override
    public int insert(ProductVO product) {
        return sqlSession.insert("kr.co.dong.product.ProductMapper.insert", product);
        
    }
    
    @Override
    public int update(ProductVO product) {
        return sqlSession.update("kr.co.dong.product.ProductMapper.update", product);
    }
    
    @Override
    public int delete(int productId) {
        return sqlSession.delete("kr.co.dong.product.ProductMapper.delete", productId);
    }
}