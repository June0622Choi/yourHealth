package kr.co.dong.order;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dong.cart.CartService;
import kr.co.dong.cart.CartVO;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private OrderService orderService;

	@Inject
	private CartService cartService;

	// 장바구니 확인 후 배송정보 입력 화면 (주문서)
	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public String checkout(HttpSession session, Model model) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		List<CartVO> cartList = cartService.getCartList(loginId);

		if (cartList == null || cartList.isEmpty()) {
			// 장바구니가 비어있으면 주문할 수 없으므로 장바구니 화면으로
			return "redirect:/cart/list";
		}

		int totalPrice = 0;
		for (CartVO vo : cartList) {
			totalPrice += vo.getPrice() * vo.getQuantity();
		}

		model.addAttribute("cartList", cartList);
		model.addAttribute("totalPrice", totalPrice);

		return "order";
	}

	// 주문서에서 배송정보 입력 후 "결제하기" -> 주문 생성
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(@ModelAttribute OrderVO orderVO, HttpSession session, Model model) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		// 화면에서 넘어온 금액을 그대로 믿지 않고, 서버에서 다시 현재 장바구니를 조회해서 계산
		List<CartVO> cartList = cartService.getCartList(loginId);

		if (cartList == null || cartList.isEmpty()) {
			return "redirect:/cart/list";
		}

		orderVO.setUsersId(loginId);

		int orderId = orderService.createOrder(orderVO, cartList);

		return "redirect:/order/complete?orderId=" + orderId;
	}

	// 주문 완료 확인 화면
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String complete(@RequestParam("orderId") int orderId, HttpSession session, Model model) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		OrderVO order = orderService.getOrderOne(orderId);
		List<OrderItemVO> items = orderService.getOrderItems(orderId);

		model.addAttribute("order", order);
		model.addAttribute("items", items);

		return "orderComplete";
	}

	// 마이페이지 - 주문내역 목록 (추후 mypage.jsp 에서 사용)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		List<OrderVO> orderList = orderService.getOrderList(loginId);
		model.addAttribute("orderList", orderList);

		return "orderList";
	}
}