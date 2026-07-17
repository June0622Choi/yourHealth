package kr.co.dong.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dong.cart.CartService;
import kr.co.dong.cart.CartVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO orderDAO;

	@Inject
	private CartService cartService;

	@Override
	public int createOrder(OrderVO orderVO, List<CartVO> cartList) {

		// 1. 총 주문금액 계산 (서버에서 다시 한번 계산 -> 화면값을 그대로 믿지 않음)
		int totalPrice = 0;
		for (CartVO cart : cartList) {
			totalPrice += cart.getPrice() * cart.getQuantity();
		}
		orderVO.setTotalPrice(totalPrice);
		orderVO.setStatus("주문완료");

		// 2. order_number 는 UNIQUE 필수 컬럼이라 서버에서 자동 생성 (화면 입력 없음)
		orderVO.setOrderNumber("ORD" + System.currentTimeMillis());

		// 3. orders 테이블에 주문 생성 -> orderVO.getOrderId() 에 생성된 PK 채워짐
		orderDAO.insertOrder(orderVO);

		// 4. 장바구니 항목들을 order_items 로 하나씩 insert
		for (CartVO cart : cartList) {
			OrderItemVO item = new OrderItemVO();
			item.setOrderId(orderVO.getOrderId());
			item.setProductId(cart.getProductId());
			item.setQuantity(cart.getQuantity());
			item.setUnitPrice(cart.getPrice());

			orderDAO.insertOrderItem(item);
		}

		// 5. 주문이 끝났으니 해당 회원의 장바구니 비우기
		cartService.clearCart(orderVO.getUsersId());

		return orderVO.getOrderId();
	}

	@Override
	public List<OrderVO> getOrderList(int usersId) {
		return orderDAO.selectOrderList(usersId);
	}

	@Override
	public OrderVO getOrderOne(int orderId) {
		return orderDAO.selectOrderOne(orderId);
	}

	@Override
	public List<OrderItemVO> getOrderItems(int orderId) {
		return orderDAO.selectOrderItems(orderId);
	}
}