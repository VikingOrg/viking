package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seaport.service.IUserService;

@Controller
@RequestMapping("/")
public class LinkNavigation {
	@Autowired
	private IUserService userService;
	
	@RequestMapping
	public String getLogin(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute(com.seaport.utils.SessionConstants.USER_MODEL, 
				userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName()));
		return "home";
	}

	@RequestMapping(value="/home")
	public String getHomePage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute(com.seaport.utils.SessionConstants.USER_MODEL, 
		userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName()));

		return "home";
	}	
	@RequestMapping(value="/help.html")
	public String getHelpPage() {
		return "common/help.html";
	}
}
