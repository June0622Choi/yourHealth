package kr.co.dong.inquiry;

import java.sql.Date;

public class InquiryVO {
	private int inquiryId;
	private int users_id;
	private Integer Product_id;
	private String title;
	private String content;
	private String answer;
	private String status;
	private String is_secret;
	private Date created_at;
    private Date answered_at;

	private String UserName;
	private String ProductName;
	
	public InquiryVO() {
	}

	public InquiryVO(int inquiryId, int users_id, Integer product_id, String title, String content, String answer,
			String status, String is_secret, Date created_at, Date answered_at, String userName, String productName) {
		super();
		this.inquiryId = inquiryId;
		this.users_id = users_id;
		Product_id = product_id;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.status = status;
		this.is_secret = is_secret;
		this.created_at = created_at;
		this.answered_at = answered_at;
		UserName = userName;
		ProductName = productName;
	}
	public int getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}
	public int getUsers_id() {
		return users_id;
	}
	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}
	public Integer getProduct_id() {
		return Product_id;
	}
	public void setProduct_id(Integer product_id) {
		Product_id = product_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIs_secret() {
		return is_secret;
	}
	public void setIs_secret(String is_secret) {
		this.is_secret = is_secret;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getAnswered_at() {
		return answered_at;
	}
	public void setAnswered_at(Date answered_at) {
		this.answered_at = answered_at;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	@Override
	public String toString() {
		return "InquiryVO [inquiryId=" + inquiryId + ", users_id=" + users_id + ", Product_id=" + Product_id + ", title="
				+ title + ", content=" + content + ", answer=" + answer + ", status=" + status + ", is_secret="
				+ is_secret + ", created_at=" + created_at + ", answered_at=" + answered_at + ", UserName=" + UserName
				+ ", ProductName=" + ProductName + "]";
	}
}