package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seaport.service.IUserService;
import com.seaport.utils.VikingConstant;

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
	private VikingConstant vikingConstant;
	
	@RequestMapping
	public String getLogin(HttpServletRequest request) throws Exception {
		return "redirect:home";
	}

	@RequestMapping(value="/home")
	public String getHomePage(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		/*Setting session variables & environment settings for user.*/
		session.setAttribute(com.seaport.utils.VikingConstant.USER_MODEL, 
				userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName()));
		session.setAttribute("system", vikingConstant);
		return "home";
	}
	
	@RequestMapping(value="/help.html")
	public String getHelpPage() throws Exception {
		return "common/help.html";
	}
	
	@RequestMapping(value="/menu")
	public String getMainMenu() throws Exception {
		return "common/menuResponsive";
	}
	
	@RequestMapping(value="/footer")
	public String getFooter() throws Exception {
		return "common/footer";
	}	
}
