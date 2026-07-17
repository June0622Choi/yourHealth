package kr.co.dong.review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "kr.co.dong.review.ReviewMapper.";

	@Override
	public List<ReviewVO> selectReviewList(int productId) {
		return sqlSession.selectList(NAMESPACE + "selectReviewList", productId);
	}

	@Override
	public void insertReview(ReviewVO vo) {
		sqlSession.insert(NAMESPACE + "insertReview", vo);
	}
}