package kr.co.dong.review;

import java.util.List;

public interface ReviewService {

	public List<ReviewVO> getReviewList(int productId);

	public void addReview(ReviewVO vo);
}