package kr.co.dong.admin;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dong.inquiry.InquiryService;
import kr.co.dong.inquiry.InquiryVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminService adminService;

	@Inject
	private InquiryService inquiryService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "admin/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			HttpServletRequest request,
			Model model) {

		AdminVO admin = adminService.login(email, password);

		if (admin != null) {
			// 이전 세션(다른 계정/유저 세션 등) 완전히 초기화 후 새로 발급
			HttpSession oldSession = request.getSession(false);
			if (oldSession != null) {
				oldSession.invalidate();
			}
			HttpSession session = request.getSession(true);

			session.setAttribute("adminId", admin.getAdminId());
			session.setAttribute("adminName", admin.getName());
			return "redirect:/admin/dashboard";
		} else {
			model.addAttribute("error", "이메일 또는 비밀번호가 일치하지 않습니다.");
			return "admin/login";
		}
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(HttpSession session, Model model) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		model.addAttribute("userCount", adminService.getUserCount());
		model.addAttribute("orderCount", adminService.getOrderCount());
		model.addAttribute("totalSales", adminService.getTotalSales());
		model.addAttribute("pendingRefundCount", adminService.getPendingRefundCount());

		// 미답변 문의 건수 (NEW 표시용)
		List<InquiryVO> inquiryList = inquiryService.getList();
		long unansweredCount = inquiryList.stream()
				.filter(i -> "답변대기".equals(i.getStatus()))
				.count();
		model.addAttribute("unansweredCount", unansweredCount);

		return "admin/dashboard";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("adminId");
		session.removeAttribute("adminName");
		return "redirect:/admin/login";
	}

	// 상품관리 - 전체 상품 목록
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String productList(HttpSession session, Model model) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		model.addAttribute("productList", adminService.getProductList());

		return "admin/productList";
	}

	// 상품 추가 화면
	@RequestMapping(value = "/products/add", method = RequestMethod.GET)
	public String addProductForm(HttpSession session) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		return "admin/productAdd";
	}

	// 상품 추가 처리
	@RequestMapping(value = "/products/add", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute ProductAdminVO vo, HttpSession session) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		adminService.addProduct(vo);

		return "redirect:/admin/products";
	}

	// 상품 수정 화면
	@RequestMapping(value = "/products/edit", method = RequestMethod.GET)
	public String editProductForm(
			@RequestParam("productId") int productId,
			HttpSession session,
			Model model) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		model.addAttribute("product", adminService.getProductOne(productId));

		return "admin/productEdit";
	}

	// 상품 수정 처리
	@RequestMapping(value = "/products/edit", method = RequestMethod.POST)
	public String editProduct(@ModelAttribute ProductAdminVO vo, HttpSession session) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		adminService.editProduct(vo);

		return "redirect:/admin/products";
	}

	// 주문관리
	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		model.addAttribute("orderList", adminService.getOrderAdminList());

		return "admin/orderList";
	}

	// 회원관리
	@RequestMapping(value = "/members", method = RequestMethod.GET)
	public String memberList(HttpSession session, Model model) {

		Integer adminId = (Integer) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin/login";
		}

		model.addAttribute("memberList", adminService.getUserAdminList());

		return "admin/memberList";
	}
	
	// 상품 삭제 처리
		@RequestMapping(value = "/products/delete", method = RequestMethod.POST)
		public String deleteProduct(@RequestParam("productId") int productId, HttpSession session) {

			Integer adminId = (Integer) session.getAttribute("adminId");
			if (adminId == null) {
				return "redirect:/admin/login";
			}

			adminService.removeProduct(productId);

			return "redirect:/admin/products";
		}
}