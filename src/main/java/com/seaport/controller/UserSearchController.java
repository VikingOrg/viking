package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.UserSearchCommand;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a Model&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */
@Controller
@RequestMapping("/userSearchAdmin")
public class UserSearchController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		
		UserSearchCommand userSearchCommand = new UserSearchCommand();
		userSearchCommand.setUserDtoList(userService.getUserDTOs(new Object[]{}));
		
		userSearchCommand.setUserPort(portService.getPortsMap());
		userSearchCommand.setUserStevidor(portService.getStevidorsMap());
		userSearchCommand.setUserCountry(userService.getContriesMap());
		
		model.put("userSearchCommand", userSearchCommand);
		return "admin/userSearchAdmin";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute UserSearchCommand userSearchCommand,
								BindingResult result) {

//		return new ModelAndView("redirect:nextViewHere", result.getModel());
		return new ModelAndView("userSearchAdmin", result.getModel());
	}
}
