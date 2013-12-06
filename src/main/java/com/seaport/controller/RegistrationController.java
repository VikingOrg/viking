package com.seaport.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.RegistrationCommand;
import com.seaport.domain.Role;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IUserService;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevedor(portService.getStevedorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());

    	model.put("registrationCommand", registrationCommand);
		return "access/register";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request,  
							@Valid @ModelAttribute RegistrationCommand registrationCommand,
							BindingResult result) {
		
		if (result.hasErrors()) {
			return new ModelAndView("register", result.getModel());
		}
		
		/*Setting up default not null values*/
		Timestamp updateDate = new Timestamp(new Date().getTime());
		registrationCommand.getUser().setCreateDate(updateDate);
		registrationCommand.getUser().setUpdateDate(updateDate);
		registrationCommand.getUser().setLogin(registrationCommand.getUser().getUserEmail());
		Role role = (Role) roleService.getRole(1);
		registrationCommand.getUser().setRole(role);
		userService.saveUser(registrationCommand.getUser());
		String message = "002340";
		return new ModelAndView("redirect:/login?message="+message, result.getModel());
	}
}
