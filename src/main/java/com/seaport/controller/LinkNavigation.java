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
}
