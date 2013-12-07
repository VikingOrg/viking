package com.seaport.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

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
import com.seaport.service.IPortService;
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
		registrationCommand.setUserStevedor(portService.getStevedorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, 
								@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
								BindingResult result) {
		if (result.hasErrors()) {
			return "admin/userEditAdmin";
		}

		registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
		userService.saveUser(registrationCommand.getUser());
		return "redirect:userSearchAdmin";
	}
}
