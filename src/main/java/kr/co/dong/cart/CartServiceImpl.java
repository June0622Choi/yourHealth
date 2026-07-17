package kr.co.dong.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO cartDAO;

	@Override
	public void addCart(CartVO vo) {
		// 같은 회원이 같은 상품을 이미 담아뒀는지 확인
		CartVO existing = cartDAO.selectCartByUserAndProduct(vo.getUsersId(), vo.getProductId());

		if (existing == null) {
			// 처음 담는 상품이면 새로 insert
			cartDAO.insertCart(vo);
		} else {
			// 이미 있으면 수량만 더해서 업데이트
			existing.setQuantity(existing.getQuantity() + vo.getQuantity());
			cartDAO.updateQuantity(existing);
		}
	}

	@Override
	public List<CartVO> getCartList(int usersId) {
		return cartDAO.selectCartList(usersId);
	}

	@Override
	public CartVO getCartOne(int cartId) {
		return cartDAO.selectCartOne(cartId);
	}

	@Override
	public void changeQuantity(int cartId, int quantity) {
		CartVO vo = new CartVO();
		vo.setCartId(cartId);
		vo.setQuantity(quantity);
		cartDAO.updateQuantity(vo);
	}

	@Override
	public void removeCart(int cartId) {
		cartDAO.deleteCart(cartId);
	}

	@Override
	public void clearCart(int usersId) {
		cartDAO.deleteCartByUser(usersId);
	}
}