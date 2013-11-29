package com.seaport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LinkNavigation {

	@RequestMapping
	public String getLogin() {
		return "home";
	}

	@RequestMapping(value="/home")
	public String getHomePage() {
		return "home";
	}	
	@RequestMapping(value="/help.html")
	public String getHelpPage() {
		return "common/help.html";
	}
}
