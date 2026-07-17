package kr.co.dong.user;

import java.util.Date;

public class UserVO {
    private int users_id;
    private String email;
    private String password;
    private String name;
    private String phone;
    private String role;
    private String address;
    private Date createdAt;
    
    public UserVO() {
    }
    
	public UserVO(int users_id, String email, String password, String name, String phone, String role, Date createdAt) {
		super();
		this.users_id = users_id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.role = role;
		this.createdAt = createdAt;
		this.address= address;
	}
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
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
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}

	@Override
	public String toString() {
		return "UserVO [users_id=" + users_id + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", role=" + role + ", address=" + address + ", createdAt=" + createdAt + "]";
	}	
	}