package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.RegistrationCommand;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a Model&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */
@Controller
@RequestMapping("/userEditAdmin")
@SessionAttributes("registrationCommand")
public class UserEditController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService userRole;
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		String userId = request.getParameter("userId");
		if (userId != null) {
			registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
			registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
			registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
			if (request.getParameter("copy")!= null) {
				registrationCommand.setFormType("C");
				registrationCommand.getUser().setUserId(null);
			} else {
				registrationCommand.setFormType("E");
			}
		}
		
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(portService.getStevidorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
								BindingResult result, RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "admin/userEditAdmin";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
		userService.saveUser(registrationCommand.getUser());
		return "redirect:userSearchAdmin";
	}
}
