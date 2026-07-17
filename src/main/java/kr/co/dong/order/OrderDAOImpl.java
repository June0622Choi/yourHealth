package kr.co.dong.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;

	// OrderMapper.xml 의 namespace + statement id
	private static final String NAMESPACE = "kr.co.dong.order.OrderMapper.";

	@Override
	public void insertOrder(OrderVO vo) {
		sqlSession.insert(NAMESPACE + "insertOrder", vo);
	}

	@Override
	public void insertOrderItem(OrderItemVO vo) {
		sqlSession.insert(NAMESPACE + "insertOrderItem", vo);
	}

	@Override
	public List<OrderVO> selectOrderList(int usersId) {
		return sqlSession.selectList(NAMESPACE + "selectOrderList", usersId);
	}

	@Override
	public OrderVO selectOrderOne(int orderId) {
		return sqlSession.selectOne(NAMESPACE + "selectOrderOne", orderId);
	}

	@Override
	public List<OrderItemVO> selectOrderItems(int orderId) {
		return sqlSession.selectList(NAMESPACE + "selectOrderItems", orderId);
	}

	@Override
	public void updateOrderStatus(int orderId, String status) {
		Map<String, Object> params = new HashMap<>();
		params.put("orderId", orderId);
		params.put("status", status);
		sqlSession.update(NAMESPACE + "updateOrderStatus", params);
	}
}