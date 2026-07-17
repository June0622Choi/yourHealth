package kr.co.dong.admin;

import java.util.List;

public interface AdminService {

	public AdminVO login(String email, String password);

	public int getUserCount();

	public int getOrderCount();

	public int getTotalSales();

	public int getPendingRefundCount();

	public List<ProductAdminVO> getProductList();

	public List<OrderAdminVO> getOrderAdminList();

	public List<UserAdminVO> getUserAdminList();

	public ProductAdminVO getProductOne(int productId);

	public void addProduct(ProductAdminVO vo);

	public void editProduct(ProductAdminVO vo);
	
	public void removeProduct(int productId);
}