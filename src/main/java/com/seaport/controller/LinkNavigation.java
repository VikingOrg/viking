package com.seaport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LinkNavigation {
	
	@RequestMapping
	public String getHomePage() {
		return "home";
	}
	
	@RequestMapping(value="/deviceSearch")
	public String getUserPage() {
		return "deviceSearch";
	}
	
	@RequestMapping(value="/deviceListAdmin")
	public String getAdminPage() {
		return "admin/deviceListAdmin";
	}
	
	@RequestMapping(value="/httpError.jsp")
	public String getErrorPage() {
		String message = "Страница не найдена.";
		return "redirect:/login?message="+message;
	}
}
