package kr.co.dong.product;

public class ProductVO {
	
	private int productId;
	private String productName;
	private int price;
	private String category;
	private int stock;
	private String description;
	private String caution;
	private String imageFileName;
	
	// 생성자 삭제! (기본 생성자만 자동 사용됨)
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCaution() {
		return caution;
	}
	public void setCaution(String caution) {
		this.caution = caution;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", price=" + price + ", category="
				+ category + ", stock=" + stock + ", description=" + description + ", caution=" + caution
				+ ", imageFileName=" + imageFileName + "]";
	}
}
