package com.seaport.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.seaport.command.RegistrationCommand;
import com.seaport.domain.Country;
import com.seaport.domain.Port;
import com.seaport.domain.Stevedor;
import com.seaport.service.IPortService;
import com.seaport.service.IRoleService;
import com.seaport.service.IUserService;

@Controller
@RequestMapping("/userEditAdmin")
@SessionAttributes("registrationCommand")
public class UserEditController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService userRole;
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
		String userId = request.getParameter("userId");
		if (userId != null) {
			registrationCommand.setUser(userService.getUser(Integer.parseInt(userId)));
			registrationCommand.setEditForm(true);
			registrationCommand.setUserRole(registrationCommand.getUser().getRole().getId());
			registrationCommand.setPswordCheck(registrationCommand.getUser().getPassword());
		}
		List<Port> portList = portService.getPorts();
		for (Port port : portList) {
			registrationCommand.getUserPort().put(port.getPortId(), port.getName());
		}
		List<Stevedor> stevedorList = portService.getStevedors();
		for (Stevedor stevedor : stevedorList) {
			registrationCommand.getUserStevedor().put(stevedor.getStevedorId(), stevedor.getName());
		}
    	List<Country> countriesList =  userService.getContries();
    	for (Country countries : countriesList) {
    		registrationCommand.getUserCountry().put(countries.getCountryId(), countries.getNameRus());
		}
    	
		model.put("registrationCommand", registrationCommand);
		return "admin/userEditAdmin";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
								BindingResult result) {
		Map model = result.getModel();
		registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
		userService.saveUser(registrationCommand.getUser());
		return new ModelAndView("redirect:userSearchAdmin", model);
	}
}
