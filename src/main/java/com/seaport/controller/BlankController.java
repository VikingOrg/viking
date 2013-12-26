package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.BlankCommand;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/yourPageHere")
public class BlankController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		
		model.put("blankCommand", new BlankCommand());
		return "nextViewHere";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute BlankCommand blankCommand,
								BindingResult result) throws Exception {

		return new ModelAndView("nextViewHere", result.getModel());
	}
}
