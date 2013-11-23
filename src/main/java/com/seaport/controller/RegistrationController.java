package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seaport.command.RegistrationCommand;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.getUser().setFirstName("Веталь");
		registrationCommand.getUser().setLastName("Скворцов");		
		model.put("registrationCommand", registrationCommand);
		return "access/register";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, 
								@ModelAttribute RegistrationCommand registrationCommand,
								BindingResult result) {
		String message = "002340";
		return "redirect:/login?message="+message;
	}
}
