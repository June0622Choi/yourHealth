package kr.co.dong.review;

import java.util.List;

public interface ReviewDAO {

	public List<ReviewVO> selectReviewList(int productId);

	public void insertReview(ReviewVO vo);
}