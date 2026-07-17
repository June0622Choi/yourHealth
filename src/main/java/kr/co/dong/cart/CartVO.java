package kr.co.dong.cart;

import java.sql.Timestamp;

public class CartVO {

	private int CartId;
	private int UsersId;
	private int productId;
	private int quantity;
	private Timestamp createdAt;
	private String productName;
	private int price;
	private String Image;
	
	 public CartVO() {
	 }
	
	public CartVO(int cartId, int usersId, int productId, int quantity, Timestamp createdAt, String productName,
			int price, String image) {
		super();
		CartId = cartId;
		UsersId = usersId;
		this.productId = productId;
		this.quantity = quantity;
		this.createdAt = createdAt;
		this.productName = productName;
		this.price = price;
		Image = image;
	}

	public int getCartId() {
		return CartId;
	}

	public void setCartId(int cartId) {
		CartId = cartId;
	}

	public int getUsersId() {
		return UsersId;
	}

	public void setUsersId(int usersId) {
		UsersId = usersId;
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

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
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

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	@Override
	public String toString() {
		return "CartVO [CartId=" + CartId + ", UsersId=" + UsersId + ", productId=" + productId + ", quantity="
				+ quantity + ", createdAt=" + createdAt + ", productName=" + productName + ", price=" + price
				+ ", Image=" + Image + "]";
	}
}
