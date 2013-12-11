package com.seaport.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

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
import org.springframework.web.servlet.support.RequestContextUtils;

import com.seaport.command.RegistrationCommand;
import com.seaport.domain.Role;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IUserService;

@Controller
@RequestMapping("/register")
@SessionAttributes("registrationCommand")
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
	public String onSubmit(HttpServletRequest request, Model model, 
							@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
							BindingResult result, RedirectAttributes redirectAttributes) {
		
		/*JSR 303 Validations.*/
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.register");
			return "access/register";
		} 
		redirectAttributes.addFlashAttribute("message", "message.user.success.register");
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		userService.saveUser(registrationCommand.getUser());
		return "redirect:/login";
	}
}
