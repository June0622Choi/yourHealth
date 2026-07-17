package kr.co.dong.admin;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "kr.co.dong.admin.AdminMapper.";

	@Override
	public AdminVO login(String email, String password) {
		AdminVO vo = new AdminVO();
		vo.setEmail(email);
		vo.setPassword(password);
		return sqlSession.selectOne(NAMESPACE + "login", vo);
	}

	@Override
	public int countUsers() {
		return sqlSession.selectOne(NAMESPACE + "countUsers");
	}

	@Override
	public int countOrders() {
		return sqlSession.selectOne(NAMESPACE + "countOrders");
	}

	@Override
	public int sumTotalSales() {
		return sqlSession.selectOne(NAMESPACE + "sumTotalSales");
	}

	@Override
	public int countPendingRefunds() {
		return sqlSession.selectOne(NAMESPACE + "countPendingRefunds");
	}

	@Override
	public List<ProductAdminVO> selectProductList() {
		return sqlSession.selectList(NAMESPACE + "selectProductList");
	}

	@Override
	public List<OrderAdminVO> selectOrderAdminList() {
		return sqlSession.selectList(NAMESPACE + "selectOrderAdminList");
	}

	@Override
	public List<UserAdminVO> selectUserAdminList() {
		return sqlSession.selectList(NAMESPACE + "selectUserAdminList");
	}

	@Override
	public ProductAdminVO selectProductOne(int productId) {
		return sqlSession.selectOne(NAMESPACE + "selectProductOne", productId);
	}

	@Override
	public void insertProduct(ProductAdminVO vo) {
		sqlSession.insert(NAMESPACE + "insertProduct", vo);
	}

	@Override
	public void updateProduct(ProductAdminVO vo) {
		sqlSession.update(NAMESPACE + "updateProduct", vo);
	}
	@Override
	public void deleteProduct(int productId) {
		sqlSession.delete(NAMESPACE + "deleteProduct", productId);
	}
}