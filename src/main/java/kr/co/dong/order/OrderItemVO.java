package kr.co.dong.order;

public class OrderItemVO {

	private int itemId;
	private int orderId;
	private int productId;
	private int quantity;
	private int unitPrice; // 주문 당시 단가 (상품 가격이 나중에 바뀌어도 주문 내역은 그대로 남도록)

	// 화면 출력용 조인 필드 (DB 컬럼 아님)
	private String productName;
	private String image;

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "OrderItemVO [itemId=" + itemId + ", orderId=" + orderId + ", productId=" + productId + ", quantity="
				+ quantity + ", unitPrice=" + unitPrice + ", productName=" + productName + ", image=" + image + "]";
	}
}