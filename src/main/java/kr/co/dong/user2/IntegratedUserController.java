package kr.co.dong.user2;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;      // ← 추가
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/integrated")
public class IntegratedUserController {

	@Autowired
	private IntegratedUserService integratedUserService;

	@GetMapping("/register")
	public String registerForm() {
		return "integrated/register";
	}

	@PostMapping("/register")
	public String register(IntegratedUserVO user, Model model) {
		integratedUserService.insert(user);
		model.addAttribute("username", user.getUsername());
		return "integrated/welcome";
	}

	@GetMapping("/login")
	public String loginForm() {
		return "integrated/login";
	}

	@PostMapping("/login")
	public String login(String username, String password, HttpSession session) {
		IntegratedUserVO user = integratedUserService.login(username, password);
		if (user != null) {
			session.setAttribute("loginId", user.getUserId());
			session.setAttribute("loginName", user.getNickname());
			return "redirect:/";
		} else {
			return "integrated/login";
		}
	}
	@GetMapping("/checkUsername")   // ← 이 메서드 추가
	
	@ResponseBody
	public String checkUsername(@RequestParam("username") String username) {
		boolean duplicate = integratedUserService.isUsernameDuplicate(username);
		return duplicate ? "duplicate" : "available";
}
}