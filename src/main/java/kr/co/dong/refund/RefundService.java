package kr.co.dong.refund;

import java.util.List;

public interface RefundService {

	// 환불 신청 (order.status 도 같이 "환불대기"로 변경)
	public void requestRefund(int orderId, int usersId, String reason);

	// 주문 취소 (환불신청 없이 바로 orders.status 를 "취소"로 변경)
	public void cancelOrder(int orderId, int usersId);

	public List<RefundVO> getRefundList(int usersId);

	public RefundVO getRefundOne(int refundsId);

	// 관리자용
	public List<RefundVO> getAllRefunds();

	public void approveRefund(int refundsId);

	public void rejectRefund(int refundsId);
}