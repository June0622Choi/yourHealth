package kr.co.dong.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "kr.co.dong.cart.CartMapper.";

	@Override
	public void insertCart(CartVO vo) {
		sqlSession.insert(NAMESPACE + "insertCart", vo);
	}

	@Override
	public List<CartVO> selectCartList(int usersId) {
		return sqlSession.selectList(NAMESPACE + "selectCartList", usersId);
	}

	@Override
	public CartVO selectCartOne(int cartId) {
		return sqlSession.selectOne(NAMESPACE + "selectCartOne", cartId);
	}

	@Override
	public CartVO selectCartByUserAndProduct(int usersId, int productId) {
		CartVO vo = new CartVO();
		vo.setUsersId(usersId);
		vo.setProductId(productId);
		return sqlSession.selectOne(NAMESPACE + "selectCartByUserAndProduct", vo);
	}

	@Override
	public void updateQuantity(CartVO vo) {
		sqlSession.update(NAMESPACE + "updateQuantity", vo);
	}

	@Override
	public void deleteCart(int cartId) {
		sqlSession.delete(NAMESPACE + "deleteCart", cartId);
	}

	@Override
	public void deleteCartByUser(int usersId) {
		sqlSession.delete(NAMESPACE + "deleteCartByUser", usersId);
	}
}