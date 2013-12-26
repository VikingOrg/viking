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
import com.seaport.validator.RegistrationValidator;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

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
							ModelMap model) throws Exception {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(portService.getStevidorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());
		
    	model.put("registrationCommand", registrationCommand);
		return "access/register";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
							@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
							BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		/*Db validations.*/
		new RegistrationValidator(userService).validate(registrationCommand, result);
		
		/*JSR 303 Validations via @Valid.*/
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			/*Didn't pass security so session is flaky..*/
			model.addAttribute("registrationCommand", registrationCommand);
			return "access/register";
		}
		
		
		redirectAttributes.addFlashAttribute("message", "message.user.success.register");
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		userService.saveUser(registrationCommand.getUser());
		return "redirect:/login";
	}
}














