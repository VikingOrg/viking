package com.seaport.controller;

import java.util.List;

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

import com.seaport.command.StevidorSearchCommand;
import com.seaport.domain.Stevidor;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a Model&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/stevidorSearch")
@SessionAttributes("stevidorSearchCommand")
public class StevidorSearchController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		StevidorSearchCommand stevidorSearchCommand = new StevidorSearchCommand();

		stevidorSearchCommand.setUserPort(portService.getPortsMap());
		stevidorSearchCommand.setUserCountry(userService.getContriesMap());
		stevidorSearchCommand.setStevidorList(portService.getStevidors());
		
		model.put("stevidorSearchCommand", stevidorSearchCommand);
		return "stevidorSearch";
	}
	
	/**
	 * Currently used as Delete function.
	 * @param request
	 * @param model
	 * @param portSearchCommand
	 * @param result
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model,
								@Valid @ModelAttribute("stevidorSearchCommand") StevidorSearchCommand portSearchCommand,
								BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "stevidorSearch";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		List<Stevidor> stevidorList = portSearchCommand.getStevidorList();
		for (Stevidor stevidor : stevidorList) {
			if (stevidor.getArchived()!=null && stevidor.getArchived().equalsIgnoreCase("Y")) {
				portService.saveStevidor(stevidor);	
			}
		}
		return "redirect:stevidorSearch";		
	}
}
