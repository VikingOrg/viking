package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String login(HttpServletRequest request,
						Model model, 
						@RequestParam(required=false) String message) throws Exception {
		if (message!=null && message.equalsIgnoreCase("002399")) {
			message = "Логин и/или пароль не найден.";
		}
		/*Check the Flash Scope message map.*/
//		Map map = RequestContextUtils.getInputFlashMap(request);
		return "access/login";
	}
	
	@RequestMapping(value = "/denied")
 	public String denied() throws Exception {
		return "access/denied";
	}
	
	@RequestMapping(value = "/login/failure")
 	public String loginFailure() throws Exception {
		String message = "002399";
		return "redirect:/login?message="+message;
	}
	
	@RequestMapping(value = "/logout")
 	public String logout() throws Exception {
		return "/access/logout";
	}
	
	@RequestMapping(value="/404.html")
	public String getErrorPage() throws Exception {
		return "blank";
	}	
}
