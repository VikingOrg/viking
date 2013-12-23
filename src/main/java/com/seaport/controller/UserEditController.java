package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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
	
	@RequestMapping(value="/edit/{userId}", method = RequestMethod.GET)
	public String editUser(@PathVariable String userId,
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setFormType("E");
		registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
		registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(portService.getStevidorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}

	@RequestMapping(value="/copy/{userId}", method = RequestMethod.GET)
	public String copyUser(HttpServletRequest request,
							@PathVariable String userId,
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setFormType("C");		
		registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
		registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		registrationCommand.getUser().setUserId(null);
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(portService.getStevidorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	/**
	 * Set forms for a new user.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/new/", method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(portService.getStevidorsMap());
		registrationCommand.setUserCountry(userService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "/admin/userEditAdmin";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		redirectAttributes.addFlashAttribute(registrationCommand);
		
		registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
		userService.saveUser(registrationCommand.getUser());
		
		//clear the command object from the session
		status.setComplete();
		return "redirect:/userSearchAdmin";
	}
}
