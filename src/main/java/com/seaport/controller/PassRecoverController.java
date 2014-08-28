package com.seaport.controller;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.InitialContext;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.PassRecoverCommand;
import com.seaport.command.RegistrationCommand;
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;

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
		/*Didn't pass security so session is flaky..*/
		model.addAttribute("registrationCommand", registrationCommand);
		
		/*JSR 303 Validations via @Valid.*/
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "passRecover";
		}
		
		User user = userService.getUser(registrationCommand.getUser().getUserEmail());
		if (user == null) {
			model.addAttribute("error", "message.user.error.generic");
			return "passRecover";
		}
		
		InitialContext ctx = new InitialContext();
		javax.mail.Session session = (javax.mail.Session) ctx.lookup("java:jboss/mail/Default");
		MimeMessage msg = new MimeMessage(session);
		msg.setSubject("Test JavaMail"); 
		msg.setContent("Thank you for requesting your password! Currently your password is:" + user.getPassword(), "text/plain"); 
		Address to = new InternetAddress(user.getUserEmail());
		msg.addRecipient(Message.RecipientType.TO, to); 
		Transport trans = session.getTransport("smtps"); 
		trans.connect("smtp.gmail.com", "viking.openshift", "viking12345678");
		trans.sendMessage(msg, msg.getAllRecipients()); trans.close();
		redirectAttributes.addFlashAttribute("message", "message.user.success.passrecover");
		
		return "redirect:/login";
	}
}
