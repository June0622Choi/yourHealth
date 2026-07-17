package kr.co.dong.inquiry;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<InquiryVO> getList() {
		return sqlSession.selectList("kr.co.dong.inquiry.InquiryMapper.getList");
	}

	@Override
	public InquiryVO getDetail(int inquiryId) {
		return sqlSession.selectOne("kr.co.dong.inquiry.InquiryMapper.getDetail", inquiryId);
	}

	@Override
	public int insert(InquiryVO inquiry) {
		return sqlSession.insert("kr.co.dong.inquiry.InquiryMapper.insert", inquiry);
	}

	@Override
	public int updateAnswer(InquiryVO inquiry) {
		return sqlSession.update("kr.co.dong.inquiry.InquiryMapper.updateAnswer", inquiry);
	}

	@Override
	public int updateContent(InquiryVO inquiry) {
		return sqlSession.update("kr.co.dong.inquiry.InquiryMapper.updateContent", inquiry);
	}

	@Override
	public int delete(int inquiryId) {
		return sqlSession.delete("kr.co.dong.inquiry.InquiryMapper.delete", inquiryId);
	}
	
	@Override
	public int deleteAnswer(int inquiryId) {
	    return sqlSession.update("kr.co.dong.inquiry.InquiryMapper.deleteAnswer", inquiryId);
	}
}
