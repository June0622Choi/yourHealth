package kr.co.dong.refund;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/refund")
public class RefundController {

	@Inject
	private RefundService refundService;

	// 마이페이지에서 "환불신청" 버튼 -> 사유 선택 후 제출
	@RequestMapping(value = "/request", method = RequestMethod.POST)
	public String requestRefund(
			@RequestParam("orderId") int orderId,
			@RequestParam("reason") String reason,
			HttpSession session) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		refundService.requestRefund(orderId, loginId, reason);

		return "redirect:/order/list";
	}

	// 마이페이지에서 "주문취소" 버튼 -> 바로 취소 처리
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String cancelOrder(
			@RequestParam("orderId") int orderId,
			HttpSession session) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		refundService.cancelOrder(orderId, loginId);

		return "redirect:/order/list";
	}

	// 관리자 - 전체 환불 목록
	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public String adminList(Model model) {

		List<RefundVO> refundList = refundService.getAllRefunds();
		model.addAttribute("refundList", refundList);

		return "admin/refundList";
	}

	// 관리자 - 환불 승인
	@RequestMapping(value = "/admin/approve", method = RequestMethod.POST)
	public String approveRefund(@RequestParam("refundsId") int refundsId) {
		refundService.approveRefund(refundsId);
		return "redirect:/refund/admin/list";
	}

	// 관리자 - 환불 거절
	@RequestMapping(value = "/admin/reject", method = RequestMethod.POST)
	public String rejectRefund(@RequestParam("refundsId") int refundsId) {
		refundService.rejectRefund(refundsId);
		return "redirect:/refund/admin/list";
	}
}