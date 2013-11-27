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
import com.seaport.command.DeviceSearchCommand;

@Controller
@RequestMapping("/deviceSearch")
public class DeviceSearchController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		
		model.put("blankCommand", new DeviceSearchCommand());
		return "deviceSearch";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute BlankCommand blankCommand,
								BindingResult result) {

//		return new ModelAndView("redirect:nextViewHere", result.getModel());
		return new ModelAndView("deviceSearch", result.getModel());
	}
}
