package com.seaport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.StevidorSearchCommand;
import com.seaport.domain.Port;
import com.seaport.domain.Stevedor;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

@Controller
@RequestMapping("/stevidorSearch")
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
		List<Stevedor> stevedorList = portService.getStevedors();
		for (Stevedor stevedor : stevedorList) {
			Port port = stevidorSearchCommand.getUserPort().get(stevedor.getPortId());
			stevedor.setPortName(port.getName());
			stevedor.setCountryName(stevidorSearchCommand.getUserCountry().get(port.getCountryId()).getNameRus());
		}
		stevidorSearchCommand.setStevedorList(stevedorList);
		
		model.put("stevidorSearchCommand", stevidorSearchCommand);
		return "stevidorSearch";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute StevidorSearchCommand portSearchCommand,
								BindingResult result) {

		return new ModelAndView("stevidorSearch", result.getModel());
	}
}
