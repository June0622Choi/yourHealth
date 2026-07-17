package kr.co.dong.refund;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDAOImpl implements RefundDAO {

	@Inject
	private SqlSession sqlSession;

	// RefundMapper.xml 의 namespace + statement id
	private static final String NAMESPACE = "kr.co.dong.refund.RefundMapper.";

	@Override
	public void insertRefund(RefundVO vo) {
		sqlSession.insert(NAMESPACE + "insertRefund", vo);
	}

	@Override
	public List<RefundVO> selectRefundList(int usersId) {
		return sqlSession.selectList(NAMESPACE + "selectRefundList", usersId);
	}

	@Override
	public RefundVO selectRefundOne(int refundsId) {
		return sqlSession.selectOne(NAMESPACE + "selectRefundOne", refundsId);
	}

	@Override
	public RefundVO selectRefundByOrderId(int orderId) {
		return sqlSession.selectOne(NAMESPACE + "selectRefundByOrderId", orderId);
	}

	@Override
	public List<RefundVO> selectAllRefunds() {
		return sqlSession.selectList(NAMESPACE + "selectAllRefunds");
	}

	@Override
	public void updateRefundStatus(RefundVO vo) {
		sqlSession.update(NAMESPACE + "updateRefundStatus", vo);
	}
}