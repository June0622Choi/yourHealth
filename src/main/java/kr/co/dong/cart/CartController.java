package kr.co.dong.cart;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Inject
	private CartService cartService;

	// 장바구니 목록 화면
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) {

		Integer loginId = (Integer) session.getAttribute("loginId");
		if (loginId == null) {
			return "redirect:/user/login";
		}

		List<CartVO> cartList = cartService.getCartList(loginId);

		int totalPrice = 0;
		for (CartVO vo : cartList) {
			totalPrice += vo.getPrice() * vo.getQuantity();
		}

		model.addAttribute("cartList", cartList);
		model.addAttribute("totalPrice", totalPrice);

		return "user/cart";
	}

	// 상품 상세/카드에서 "장바구니 담기"
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCart(
			@RequestParam("productId") int productId,
			@RequestParam(value = "quantity", defaultValue = "1") int quantity,
			HttpSession session) {

		System.out.println("==================================");
		System.out.println("장바구니 담기 실행");
		System.out.println("productId = " + productId);
		System.out.println("quantity = " + quantity);
		System.out.println("loginId = " + session.getAttribute("loginId"));
		System.out.println("==================================");

		Integer loginId = (Integer) session.getAttribute("loginId");

		if (loginId == null) {
			System.out.println("로그인 안되어 있음");
			return "redirect:/user/login";
		}

		CartVO vo = new CartVO();
		vo.setUsersId(loginId);
		vo.setProductId(productId);
		vo.setQuantity(quantity);

		cartService.addCart(vo);

		System.out.println("장바구니 저장 완료!");

		return "redirect:/cart/list";
	}
	// 수량 변경
	@RequestMapping(value = "/updateQuantity", method = RequestMethod.POST)
	@ResponseBody
	public String updateQuantity(
			@RequestParam("cartId") int cartId,
			@RequestParam("quantity") int quantity) {

		if (quantity < 1) {
			quantity = 1;
		}

		cartService.changeQuantity(cartId, quantity);

		return "ok";
	}

	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteCart(@RequestParam("cartId") int cartId) {

		cartService.removeCart(cartId);

		return "redirect:/cart/list";
	}
}