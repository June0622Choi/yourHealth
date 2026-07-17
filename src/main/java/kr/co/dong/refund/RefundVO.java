package kr.co.dong.refund;

import java.sql.Timestamp;

public class RefundVO {

	private int refundsId;
	private int orderId;
	private int usersrId;
	private String reason;
	private String status;
	private Timestamp reuqestedAt;
	private Timestamp processedAt;
	private String orderNumber;
	

	public int getRefundsId() {
		return refundsId;
	}
	public void setRefundsId(int refundsId) {
		this.refundsId = refundsId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUsersrId() {
		return usersrId;
	}
	public void setUsersrId(int usersrId) {
		this.usersrId = usersrId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getReuqestedAt() {
		return reuqestedAt;
	}
	public void setReuqestedAt(Timestamp reuqestedAt) {
		this.reuqestedAt = reuqestedAt;
	}
	public Timestamp getProcessedAt() {
		return processedAt;
	}
	public void setProcessedAt(Timestamp processedAt) {
		this.processedAt = processedAt;
	}
	public String getOrderNumber() {   // <- 이것도 추가
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {   // <- 이것도 추가
		this.orderNumber = orderNumber;
	}
	@Override
	public String toString() {
		return "RefundVO [refundsId=" + refundsId + ", orderId=" + orderId + ", usersrId=" + usersrId + ", reason="
				+ reason + ", status=" + status + ", reuqestedAt=" + reuqestedAt + ", processedAt=" + processedAt + "]";
	}
	
	
	
	
}
