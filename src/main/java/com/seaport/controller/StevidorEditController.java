package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.StevidorEditCommand;
import com.seaport.command.StevidorSearchCommand;

@Controller
@RequestMapping("/stevidorEdit")
public class StevidorEditController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		String action = request.getParameter("stevidorId");
		model.put("stevidorSearchCommand", new StevidorEditCommand());
		return "stevidorEdit";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute StevidorSearchCommand portSearchCommand,
								BindingResult result) {

		return new ModelAndView("stevidorEdit", result.getModel());
	}
}
