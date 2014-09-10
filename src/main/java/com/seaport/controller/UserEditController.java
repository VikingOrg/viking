package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.seaport.domain.Role;
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingUtils;
import com.seaport.validator.UserEditValidator;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
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
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IStevidorService stevidorService;
	
	@RequestMapping(value="/edit/{userId}", method = RequestMethod.GET)
	public String editUser(@PathVariable String userId,
							ModelMap model)  throws Exception{
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setFormType("E");
		registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
		registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(stevidorService.getStevidorsMap());
		registrationCommand.setUserCountry(countryService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}

	@RequestMapping(value="/copy/{userId}", method = RequestMethod.GET)
	public String copyUser(HttpServletRequest request,
							@PathVariable String userId,
							ModelMap model) throws Exception {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setFormType("C");		
		registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
		registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		registrationCommand.getUser().setUserId(null);
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(stevidorService.getStevidorsMap());
		registrationCommand.setUserCountry(countryService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	/**
	 * Set forms for a new user.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/new/", method = RequestMethod.GET)
	public String newUser(ModelMap model) throws Exception {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(stevidorService.getStevidorsMap());
		registrationCommand.setUserCountry(countryService.getContriesMap());
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		/*Validation block.*/
		User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstants.USER_MODEL);
		if (registrationCommand.getFormType().equals("E")) {
			if (user.getUserId() == registrationCommand.getUser().getUserId()) {
				if (!VikingUtils.isEmpty(registrationCommand.getOldPassword()) || 
						!VikingUtils.isEmpty(registrationCommand.getNewPassword()) ||
						!VikingUtils.isEmpty(registrationCommand.getNewPasswordCheck()) ) {
					
					/*Db validations.*/
					new UserEditValidator(userService).validate(registrationCommand, result);
				}
			}
		}
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "/admin/userEditAdmin";
		}
		
		/*For user edit.*/
		if (registrationCommand.getFormType().equals("E")) {
			if (user.getUserId() == registrationCommand.getUser().getUserId() && !VikingUtils.isEmpty(registrationCommand.getOldPassword())) {
				BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
				String encPassword = bCryptPasswordEncoder.encode(registrationCommand.getNewPassword());
				registrationCommand.getUser().setPassword(encPassword);
			}
			registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
		} else {
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			String encPassword = bCryptPasswordEncoder.encode(registrationCommand.getUser().getPassword());
			registrationCommand.getUser().setPassword(encPassword);
		}
		userService.saveUser(registrationCommand.getUser());
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		redirectAttributes.addFlashAttribute(registrationCommand);
		
		//clear the command object from the session
		status.setComplete();
		return "redirect:/userSearchAdmin";
	}
}
