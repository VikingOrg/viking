package com.seaport.controller;

import java.sql.Timestamp;
import java.util.Date;

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

import com.seaport.command.StevidorEditCommand;
import com.seaport.domain.User;
import com.seaport.service.IPortService;
import com.seaport.utils.SessionConstants;

/**
 * The Controller class that invoke business logic and create a Model&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/stevidorEdit")
@SessionAttributes("stevidorEditCommand")
public class StevidorEditController {
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		String stevidorId = request.getParameter("stevidorId");
		StevidorEditCommand stevidorEditCommand = new StevidorEditCommand();
		if (stevidorId != null) {
			stevidorEditCommand.setStevidor(portService.getStevidor(Integer.parseInt(stevidorId)));
			if (request.getParameter("copy")!= null) {
				stevidorEditCommand.setFormType("C");
				stevidorEditCommand.getStevidor().setStevidorId(null);
			} else {
				stevidorEditCommand.setFormType("E");
			}
		}
		
		stevidorEditCommand.setUserPort(portService.getPortsMap());
		model.put("stevidorEditCommand", stevidorEditCommand);
		return "stevidorEdit";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("stevidorEditCommand") StevidorEditCommand stevidorEditCommand,
								BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "stevidorEdit";
		}
		
		/*Setting up default not null values*/
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = (User)request.getSession().getAttribute(SessionConstants.USER_MODEL);
		if (stevidorEditCommand.getStevidor().getStevidorId()== null) {
			stevidorEditCommand.getStevidor().setCreateUserId(user.getUserId());
			stevidorEditCommand.getStevidor().setCreateDate(updateDate);
		}
		stevidorEditCommand.getStevidor().setUpdateUserId(user.getUserId());
		stevidorEditCommand.getStevidor().setUpdateDate(updateDate);
		
		portService.saveStevidor(stevidorEditCommand.getStevidor());
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		
		return "redirect:stevidorSearch";
	}
}
