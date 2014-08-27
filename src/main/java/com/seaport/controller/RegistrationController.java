package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

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
import com.seaport.service.ICountryService;
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
	@Autowired
	private ICountryService countryService;	
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		registrationCommand.setUserPort(portService.getPortsMap());
		registrationCommand.setUserStevidor(portService.getStevidorsMap());
		registrationCommand.setUserCountry(countryService.getContriesMap());
		
    	model.put("registrationCommand", registrationCommand);
		return "access/register";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
							@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
							BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		/*Db validations.*/
		new RegistrationValidator(userService).validate(registrationCommand, result);
		
		// Validate the reCAPTCHA
		String remoteAddr = request.getRemoteAddr();
		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();

		//		Public Key:	6LcPCO0SAAAAAJyY9a_7lV8-t1CYfhjPc6C45fat
		//		Private Key:	6LcPCO0SAAAAAF4ICBa4v-Src4Vp3dpiI5ALImCO
		reCaptcha.setPrivateKey("6LcPCO0SAAAAAF4ICBa4v-Src4Vp3dpiI5ALImCO");

		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, registrationCommand.getRecaptcha_challenge_field(), registrationCommand.getRecaptcha_response_field());		
		if (!reCaptchaResponse.isValid()) {
			result.rejectValue("recaptcha_response_field", "user.notmatch.password");
		}
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			/*Didn't pass security yet so session is flaky..*/
			model.addAttribute("registrationCommand", registrationCommand);
			return "access/register";
		}		
		
		redirectAttributes.addFlashAttribute("message", "message.user.success.register");
		registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String encPassword = bCryptPasswordEncoder.encode(registrationCommand.getUser().getPassword());
		registrationCommand.getUser().setPassword(encPassword);
		userService.saveUser(registrationCommand.getUser());
		return "redirect:/login";
	}
}














