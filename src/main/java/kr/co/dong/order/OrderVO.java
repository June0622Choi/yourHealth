package kr.co.dong.order;

import java.sql.Timestamp;
import java.util.List;

public class OrderVO {

	private int orderId;
	private int usersId;
	private String orderNumber;
	private int totalPrice;
	private String receiverName;
	private String receiverPhone;
	private String address;
	private String paymentMethod;
	private String status;
	private Timestamp orderedAt;

	private List<OrderItemVO> items;

	public OrderVO() {
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUsersId() {
		return usersId;
	}

	public void setUsersId(int usersId) {
		this.usersId = usersId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getOrderedAt() {
		return orderedAt;
	}

	public void setOrderedAt(Timestamp orderedAt) {
		this.orderedAt = orderedAt;
	}

	public List<OrderItemVO> getItems() {
		return items;
	}

	public void setItems(List<OrderItemVO> items) {
		this.items = items;
	}
}