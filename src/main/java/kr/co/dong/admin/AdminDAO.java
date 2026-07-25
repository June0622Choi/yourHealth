package kr.co.dong.admin;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	public AdminVO login(String email, String password);

	public int countUsers();

	public int countOrders();

	public int sumTotalSales();

	public int countPendingRefunds();

	public List<ProductAdminVO> selectProductList();

	public List<OrderAdminVO> selectOrderAdminList();

	public List<UserAdminVO> selectUserAdminList();

	// 상품 한 건 조회 (수정화면용)
	public ProductAdminVO selectProductOne(int productId);

	// 상품 추가
	public void insertProduct(ProductAdminVO vo);

	// 상품 수정
	public void updateProduct(ProductAdminVO vo);
	
	// 상품 삭제
	public void deleteProduct(int productId);
		
	// 카테고리별 매출 비중
	public List<Map<String, Object>> selectSalesByCategory();
}