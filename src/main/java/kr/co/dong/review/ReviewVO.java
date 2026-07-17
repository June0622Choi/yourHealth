package kr.co.dong.review;

import java.sql.Timestamp;

public class ReviewVO {
	
	private int reviewsId;
	private int productId;
	private int rating;
	private String content;
	private Timestamp createdAt;

	public ReviewVO() {
	}
	public ReviewVO(int reviewsId, int productId, int rating, String content, Timestamp createdAt) {
		super();
		this.reviewsId = reviewsId;
		this.productId = productId;
		this.rating = rating;
		this.content = content;
		this.createdAt = createdAt;
	}

	public int getReviewsId() {
		return reviewsId;
	}

	public void setReviewsId(int reviewsId) {
		this.reviewsId = reviewsId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewsId=" + reviewsId + ", productId=" + productId + ", rating=" + rating + ", content="
				+ content + ", createdAt=" + createdAt + "]";
	}
}
