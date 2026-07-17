package kr.co.dong.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDAO;

	@Override
	public AdminVO login(String email, String password) {
		return adminDAO.login(email, password);
	}

	@Override
	public int getUserCount() {
		return adminDAO.countUsers();
	}

	@Override
	public int getOrderCount() {
		return adminDAO.countOrders();
	}

	@Override
	public int getTotalSales() {
		return adminDAO.sumTotalSales();
	}

	@Override
	public int getPendingRefundCount() {
		return adminDAO.countPendingRefunds();
	}

	@Override
	public List<ProductAdminVO> getProductList() {
		return adminDAO.selectProductList();
	}

	@Override
	public List<OrderAdminVO> getOrderAdminList() {
		return adminDAO.selectOrderAdminList();
	}

	@Override
	public List<UserAdminVO> getUserAdminList() {
		return adminDAO.selectUserAdminList();
	}

	@Override
	public ProductAdminVO getProductOne(int productId) {
		return adminDAO.selectProductOne(productId);
	}

	@Override
	public void addProduct(ProductAdminVO vo) {
		adminDAO.insertProduct(vo);
	}

	@Override
	public void editProduct(ProductAdminVO vo) {
		adminDAO.updateProduct(vo);
	}
	@Override
	public void removeProduct(int productId) {
		adminDAO.deleteProduct(productId);
	}
}