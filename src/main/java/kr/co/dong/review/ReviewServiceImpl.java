package kr.co.dong.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO reviewDAO;

	@Override
	public List<ReviewVO> getReviewList(int productId) {
		return reviewDAO.selectReviewList(productId);
	}

	@Override
	public void addReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}
}