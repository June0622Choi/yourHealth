package kr.co.dong.inquiry;

import java.util.List;

public interface InquiryService {
	List<InquiryVO> getList();
	InquiryVO getDetail(int inquiryId);
	int insert(InquiryVO inquiry);
	int updateAnswer(InquiryVO inquiry);
	int updateContent(InquiryVO inquiry);
	int delete(int inquiryId);
	int deleteAnswer(int inquiryId);
}