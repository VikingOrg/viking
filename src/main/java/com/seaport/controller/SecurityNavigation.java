package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping
public class SecurityNavigation {
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request,
						Model model, 
						@RequestParam(required=false) String message) {
		if (message!=null && message.equalsIgnoreCase("002340")) {
			message = "Вы успешно зарегистрировались. Используйте новый Логин для входа в систему.";
		} else if (message!=null && message.equalsIgnoreCase("002399")) {
			message = "Логин и/или пароль не найден.";
		}

		model.addAttribute("message", message);
		return "access/login";
	}
	
	@RequestMapping(value = "/denied")
 	public String denied() {
		return "access/denied";
	}
	
	@RequestMapping(value = "/login/failure")
 	public String loginFailure() {
		String message = "002399";
		return "redirect:/login?message="+message;
	}
	
	
	@RequestMapping(value = "/logout")
 	public String logout() {
		return "/access/logout";
	}
	
	@RequestMapping(value="/404.html")
	public String getErrorPage() {
		return "blank";
	}	
}
