package kr.co.dong.review;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Inject
	private ReviewService reviewService;

	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String list(@RequestParam("product_id") int productId) {

		List<ReviewVO> reviews = reviewService.getReviewList(productId);

		StringBuilder sb = new StringBuilder();
		sb.append("[");

		for (int i = 0; i < reviews.size(); i++) {
			ReviewVO r = reviews.get(i);

			sb.append("{");
			sb.append("\"rating\":").append(r.getRating()).append(",");
			sb.append("\"content\":\"").append(escape(r.getContent())).append("\"");
			sb.append("}");

			if (i < reviews.size() - 1) {
				sb.append(",");
			}
		}

		sb.append("]");

		return sb.toString();
	}

	// 리뷰 작성 (로그인한 유저만 가능)
	@RequestMapping(value = "/write", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String write(
			@RequestParam("productId") int productId,
			@RequestParam("rating") int rating,
			@RequestParam("content") String content,
			HttpSession session) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "login_required";
		}

		ReviewVO vo = new ReviewVO();
		vo.setProductId(productId);
		vo.setRating(rating);
		vo.setContent(content);

		reviewService.addReview(vo);

		return "ok";
	}

	private String escape(String text) {
		if (text == null) {
			return "";
		}
		return text.replace("\\", "\\\\")
				.replace("\"", "\\\"")
				.replace("\n", "\\n")
				.replace("\r", "");
	}
}