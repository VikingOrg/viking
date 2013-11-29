package com.seaport.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.RegistrationCommand;
import com.seaport.service.IRoleService;
import com.seaport.service.IUserService;

@Controller
@RequestMapping("/userEditAdmin")
@SessionAttributes("registrationCommand")
public class UserEditController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService userRole;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		String userId = request.getParameter("userId");
		if (userId != null) {
			registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
			registrationCommand.setEditForm(true);
			registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
		}
		
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
								BindingResult result) {
		Map model = result.getModel();
		registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
		userService.saveUser(registrationCommand.getUser());
		return new ModelAndView("redirect:userSearchAdmin", model);
	}
}
