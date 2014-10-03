package com.seaport.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingUtil;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/passRecover")
@SessionAttributes("registrationCommand")
public class PassRecoverController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IPortService portService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IStevidorService stevidorService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(stevidorService.getStevidorsMap());
		registrationCommand.setUserCountry(countryService.getContriesMap());
		
    	model.put("registrationCommand", registrationCommand);
		return "passRecover";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
							@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
							BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		/*Didn't pass security yet...*/
		model.addAttribute("registrationCommand", registrationCommand);
		
		/*JSR 303 Validations via @Valid.*/
//		if (result.hasErrors()) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "passRecover";
//		}
		
		User user = userService.getUser(registrationCommand.getUser().getUserEmail());
		if (user == null) {
			model.addAttribute("error", "message.user.error.generic");
			return "passRecover";
		}

    	/*Generate new password.*/
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String uuid = UUID.randomUUID().toString().substring(0, 8);
		System.out.println("uuid = " + uuid);
		String encPassword = bCryptPasswordEncoder.encode(uuid);
		user.setPassword(encPassword);    
		
		String messageText = "Уважаемый(ая) " + user.getFirstName() + " " + user.getLastName() + "," +
				  "\n\n Ваш пароль для входа в Систему ИТТ24 был изменен."+
                  "\n\n Новый пароль:"+ uuid + 
                  "\n\n После входа в Систему - измените его на более безопасный." + 
                  "\n\n С уважением, Администрация.";
		
		VikingUtil.sendEmail("ИТТ24: Восстановление пароля", messageText, user.getUserEmail());
        
        /*saving new password after successfully sent email.*/
        userService.saveUser(user);
		redirectAttributes.addFlashAttribute("message", "message.user.success.passrecover");
		return "redirect:/login";
	}
	
}
