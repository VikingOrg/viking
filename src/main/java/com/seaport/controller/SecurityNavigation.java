package com.seaport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping
public class SecurityNavigation {
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "access/login";
	}
	
	@RequestMapping(value = "/denied")
 	public String denied() throws Exception {
		return "access/denied";
	}
	
	@RequestMapping(value = "/login/failure")
 	public String loginFailure(RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("error", "message.login.failed");
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/logout")
 	public String logout(RedirectAttributes redirectAttributes) throws Exception {
		redirectAttributes.addFlashAttribute("message", "message.user.logout");
		return "redirect:/login";
	}
	
	@RequestMapping(value="/404.html")
	public String getErrorPage() throws Exception {
		return "blank";
	}	
}
