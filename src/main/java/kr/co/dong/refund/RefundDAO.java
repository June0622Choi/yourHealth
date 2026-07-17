package kr.co.dong.refund;

import java.util.List;

public interface RefundDAO {

	// 환불 신청 등록
	public void insertRefund(RefundVO vo);

	// 회원의 환불 목록 (마이페이지용)
	public List<RefundVO> selectRefundList(int usersId);

	// 환불 한 건 조회
	public RefundVO selectRefundOne(int refundsId);

	// 특정 주문에 이미 환불 신청이 있는지 확인 (중복 신청 방지)
	public RefundVO selectRefundByOrderId(int orderId);

	// 관리자용 - 전체 환불 목록
	public List<RefundVO> selectAllRefunds();

	// 환불 상태 변경 (관리자 승인/거절 처리용)
	public void updateRefundStatus(RefundVO vo);
	
}
	