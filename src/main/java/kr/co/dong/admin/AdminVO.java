package kr.co.dong.admin;

import java.sql.Timestamp;

public class AdminVO {

	private int adminId;
	private String email;
	private String password;
	private String name;
	private String phone;
	private Timestamp createdAt;

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", createdAt=" + createdAt + "]";
	}
}