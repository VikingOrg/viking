package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seaport.service.IUserService;
import com.seaport.utils.SystemConstants;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/")
public class LinkNavigation {
	@Autowired
	private IUserService userService;
	@Autowired
	private SystemConstants systemConstants;
	
	@RequestMapping
	public String getLogin(HttpServletRequest request) {
		return "redirect:home";
	}

	@RequestMapping(value="/home")
	public String getHomePage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.setAttribute(com.seaport.utils.SystemConstants.USER_MODEL, 
				userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName()));
		session.setAttribute("system", systemConstants);
		return "home";
	}
	
	@RequestMapping(value="/help.html")
	public String getHelpPage() {
		return "common/help.html";
	}
}
