package kr.co.dong.cart;

import java.util.List;

public interface CartDAO {

	// 장바구니에 상품 담기
	public void insertCart(CartVO vo);

	// 특정 회원의 장바구니 전체 목록 (상품정보 조인)
	public List<CartVO> selectCartList(int usersId);

	// 장바구니 한 건 조회 (수량변경/삭제 전 확인용)
	public CartVO selectCartOne(int cartId);

	// 이미 담겨있는 상품인지 확인 (같은 상품 중복 담기 방지 -> 수량만 증가시키기 위함)
	public CartVO selectCartByUserAndProduct(int usersId, int productId);

	// 수량 변경
	public void updateQuantity(CartVO vo);

	// 장바구니 한 건 삭제
	public void deleteCart(int cartId);

	// 주문 완료 후 해당 회원의 장바구니 비우기
	public void deleteCartByUser(int usersId);
}