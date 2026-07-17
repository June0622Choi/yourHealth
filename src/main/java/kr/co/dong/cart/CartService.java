package kr.co.dong.cart;

import java.util.List;

public interface CartService {

	// 담기: 이미 담긴 상품이면 수량 증가, 없으면 새로 insert
	public void addCart(CartVO vo);

	public List<CartVO> getCartList(int usersId);

	public CartVO getCartOne(int cartId);

	public void changeQuantity(int cartId, int quantity);

	public void removeCart(int cartId);

	public void clearCart(int usersId);
}