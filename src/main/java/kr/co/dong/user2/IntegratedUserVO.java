package kr.co.dong.user2;

import java.sql.Date;

public class IntegratedUserVO {
    private int userId;
    private String username;
    private String password;
    private String nickname;
    private String email;
    private Date createdAt;
    
    public IntegratedUserVO() {
    }
    
	public IntegratedUserVO(int userId, String username, String password, String nickname, String email,
			Date createdAt) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
		this.createdAt = createdAt;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	@Override
	public String toString() {
		return "IntegratedUserVO [userId=" + userId + ", username=" + username + ", password=" + password
				+ ", nickname=" + nickname + ", email=" + email + ", createdAt=" + createdAt + "]";
	}
    
    
}
