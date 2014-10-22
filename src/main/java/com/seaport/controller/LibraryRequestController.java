package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.LibraryRequestCommand;
import com.seaport.domain.User;
import com.seaport.utils.VikingConstant;
import com.seaport.utils.VikingUtil;

/**
 * The Controller class for support page 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 10/22/14 <P>
 */

@Controller
@RequestMapping("/libraryRequest")
public class LibraryRequestController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
    	model.put("libraryRequestCommand", new LibraryRequestCommand());
		return "libraryRequest";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
							LibraryRequestCommand libraryRequestCommand,
							BindingResult result, RedirectAttributes redirectAttributes) throws Exception {

		User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstant.USER_MODEL);
		if (user == null || VikingUtil.isEmpty(libraryRequestCommand.getSupportMessage())) {
			model.addAttribute("error", "message.user.error.generic");
			return "libraryRequest";
		}
		String messageText = libraryRequestCommand.getSupportMessage();
		VikingUtil.sendEmail("Запрос в службу потдержки от " + user.getFirstName() +" "+ user.getLastName(), 
				messageText, VikingConstant.MAIL_ADMIN_EMAIL);
        
		redirectAttributes.addFlashAttribute("message", "message.support.success");
		return "redirect:/libraryRequest";
	}
	
}
