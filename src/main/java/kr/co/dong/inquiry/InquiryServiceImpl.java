package kr.co.dong.inquiry;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private InquiryDAO inquiryDAO;

	@Override
	public List<InquiryVO> getList() {
		return inquiryDAO.getList();
	}

	@Override
	public InquiryVO getDetail(int inquiryId) {
		return inquiryDAO.getDetail(inquiryId);
	}

	@Override
	public int insert(InquiryVO inquiry) {
		return inquiryDAO.insert(inquiry);
	}

	@Override
	public int updateAnswer(InquiryVO inquiry) {
		return inquiryDAO.updateAnswer(inquiry);
	}

	@Override
	public int updateContent(InquiryVO inquiry) {
		return inquiryDAO.updateContent(inquiry);
	}

	@Override
	public int delete(int inquiryId) {
		return inquiryDAO.delete(inquiryId);
	}

	@Override
	public int deleteAnswer(int inquiryId) {
		return inquiryDAO.deleteAnswer(inquiryId);
	}
}