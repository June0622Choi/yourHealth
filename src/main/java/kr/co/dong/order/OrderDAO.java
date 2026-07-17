package kr.co.dong.order;

import java.util.List;

public interface OrderDAO {

	// 주문(orders) insert -> insert 후 vo.orderId 에 auto_increment 값 채워짐
	public void insertOrder(OrderVO vo);

	// 주문상세(order_items) insert
	public void insertOrderItem(OrderItemVO vo);

	// 회원의 주문 목록 (마이페이지 주문내역용)
	public List<OrderVO> selectOrderList(int usersId);

	// 주문 한 건 조회
	public OrderVO selectOrderOne(int orderId);

	// 주문에 속한 상품 목록 (상품정보 조인)
	public List<OrderItemVO> selectOrderItems(int orderId);
	
	// 주문 상태 변경 (취소/환불대기/환불완료 등)
	public void updateOrderStatus(int orderId, String status);
}