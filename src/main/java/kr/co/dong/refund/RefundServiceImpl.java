package kr.co.dong.refund;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dong.order.OrderDAO;

@Service
public class RefundServiceImpl implements RefundService {

	@Inject
	private RefundDAO refundDAO;

	@Inject
	private OrderDAO orderDAO;

	@Override
	public void requestRefund(int orderId, int usersId, String reason) {

		RefundVO vo = new RefundVO();
		vo.setOrderId(orderId);
		vo.setUsersrId(usersId);
		vo.setReason(reason);
		vo.setStatus("환불대기");

		refundDAO.insertRefund(vo);

		// 주문 상태도 "환불대기"로 같이 변경
		orderDAO.updateOrderStatus(orderId, "환불대기");
	}

	@Override
	public void cancelOrder(int orderId, int usersId) {
		// 환불신청 없이 바로 주문 상태만 "취소"로 변경
		orderDAO.updateOrderStatus(orderId, "취소");
	}

	@Override
	public List<RefundVO> getRefundList(int usersId) {
		return refundDAO.selectRefundList(usersId);
	}

	@Override
	public RefundVO getRefundOne(int refundsId) {
		return refundDAO.selectRefundOne(refundsId);
	}

	@Override
	public List<RefundVO> getAllRefunds() {
		return refundDAO.selectAllRefunds();
	}

	@Override
	public void approveRefund(int refundsId) {
		RefundVO vo = refundDAO.selectRefundOne(refundsId);
		vo.setStatus("환불완료");

		refundDAO.updateRefundStatus(vo);
		orderDAO.updateOrderStatus(vo.getOrderId(), "환불완료");
	}

	@Override
	public void rejectRefund(int refundsId) {
		RefundVO vo = refundDAO.selectRefundOne(refundsId);
		vo.setStatus("환불거절");

		refundDAO.updateRefundStatus(vo);
		orderDAO.updateOrderStatus(vo.getOrderId(), "환불거절");
	}
}