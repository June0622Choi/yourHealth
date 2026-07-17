package kr.co.dong.order;

import java.util.List;

import kr.co.dong.cart.CartVO;

public interface OrderService {

	// 장바구니 목록을 받아서 주문(orders) + 주문상세(order_items) 생성 후,
	// 성공하면 생성된 order_id 를 반환. 완료 후 장바구니는 비워줌.
	public int createOrder(OrderVO orderVO, List<CartVO> cartList);

	public List<OrderVO> getOrderList(int usersId);

	public OrderVO getOrderOne(int orderId);

	public List<OrderItemVO> getOrderItems(int orderId);
}