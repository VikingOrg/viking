package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

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

import com.seaport.command.SupportCommand;
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingUtil;

/**
 * The Controller class for support page 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 09/18/14 <P>
 */

@Controller
@RequestMapping("/support")
public class SupportController {
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
    	model.put("supportCommand", new SupportCommand());
		return "support";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
							SupportCommand supportCommand,
							BindingResult result, RedirectAttributes redirectAttributes) throws Exception {

		/*JSR 303 Validations via @Valid.*/
//		if (result.hasErrors()) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "support";
//		}
		User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstant.USER_MODEL);
		if (user == null || VikingUtil.isEmpty(supportCommand.getSupportMessage())) {
			model.addAttribute("error", "message.user.error.generic");
			return "support";
		}
		String messageText = supportCommand.getSupportMessage();
		VikingUtil.sendEmail(user.getUserEmail(), user.getUserEmail(), 
				"Запрос в службу потдержки от" + user.getFirstName() +" "+ user.getLastName(), 
				messageText, "viking.openshift@gmail.com");
        
		redirectAttributes.addFlashAttribute("message", "message.support.success");
		return "redirect:/support";
	}
	
}
