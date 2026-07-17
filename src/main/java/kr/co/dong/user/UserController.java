package kr.co.dong.user;
import kr.co.dong.login.UserService;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private UserService userService;
	
	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(String email, String password, HttpServletRequest request) {
		UserVO user = userService.login(email, password);
		
		if (user != null) {
			// 이전 세션(다른 계정/관리자 세션 등) 완전히 초기화 후 새로 발급
			HttpSession oldSession = request.getSession(false);
			if (oldSession != null) {
				oldSession.invalidate();
			}
			HttpSession session = request.getSession(true);

			session.setAttribute("loginId", user.getUsers_id());
			session.setAttribute("loginName", user.getName());
			return "redirect:/";
		} else {
			return "user/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/register")
	public String register(UserVO user) {
		userService.insert(user);
		return "redirect:/user/login";
	}
}