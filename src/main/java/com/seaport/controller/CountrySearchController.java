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

import com.seaport.command.CountrySearchCommand;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/countrySearch")
@SessionAttributes("countrySearchCommand")
public class CountrySearchController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		CountrySearchCommand countrySearchCommand = new CountrySearchCommand();
		countrySearchCommand.setCountryList(userService.getContries());
		model.put("countrySearchCommand", countrySearchCommand);
		return "countrySearch";
	}
	
	/**
	 * Currently used as Delete function.
	 * @param request
	 * @param model
	 * @param stevidorSearchCommand
	 * @param result
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model,
								@Valid @ModelAttribute("countrySearchCommand") CountrySearchCommand countrySearchCommand,
								BindingResult result, RedirectAttributes redirectAttributes) throws Exception {

		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "countrySearch";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		return "redirect:countrySearch";		
	}
}
