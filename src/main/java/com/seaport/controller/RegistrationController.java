package com.seaport.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seaport.command.RegistrationCommand;
import com.seaport.service.UserService;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	@Autowired
	private UserService userService;	
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		model.put("registrationCommand", registrationCommand);
		return "access/register";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, 
								@ModelAttribute RegistrationCommand registrationCommand,
								BindingResult result) {
		
		/*Setting up default not null values*/
		Timestamp updateDate = new Timestamp(new Date().getTime());
		registrationCommand.getUser().setCreateDate(updateDate);
		registrationCommand.getUser().setUpdateDate(updateDate);
		registrationCommand.getUser().setCreateUserId(999);
		userService.saveUser(registrationCommand.getUser());
		String message = "002340";
		return "redirect:/login?message="+message;
	}
}
