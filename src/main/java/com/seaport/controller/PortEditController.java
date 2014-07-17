package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.seaport.command.PortEditCommand;
import com.seaport.dao.ISystemDAO;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/17/14 <P>
 */

@Controller
@RequestMapping("/portEdit")
@SessionAttributes("portEditCommand")
public class PortEditController {
	@Autowired
	private IPortService portService;
	@Autowired
	private ISystemDAO systemRepo;
	@Autowired
	private IUserService userService;
	
	/**
	 * Setup for Port Editing form.
	 * @param request
	 * @param portId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit/{portId}", method = RequestMethod.GET)
	public String editUser(HttpServletRequest request,
							@PathVariable String portId, 
							ModelMap model)  throws Exception{
		PortEditCommand portEditCommand = new PortEditCommand();
		if (portId != null) {
			portEditCommand.setPort(portService.getPort(Integer.parseInt(portId)));
		}
		
		portEditCommand.setCountryMap(userService.getContriesMap());
		model.put("portEditCommand", portEditCommand);
		return "portEdit";
	}
	
	/**
	 * Setup for a new Port form
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/new/", method = RequestMethod.GET)
	public String newUser(ModelMap model) throws Exception {
		PortEditCommand portEditCommand = new PortEditCommand();
		
		portEditCommand.setCountryMap(userService.getContriesMap());
		model.put("portEditCommand", portEditCommand);
		return "portEdit";
	}
	
	
//	@RequestMapping(method = RequestMethod.POST) 
//	public String onSubmit(HttpServletRequest request, Model model, 
//								@Valid @ModelAttribute("registrationCommand") RegistrationCommand registrationCommand,
//								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
//		
//		if (result.hasErrors()) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "/admin/userEditAdmin";
//		}
//		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
//		redirectAttributes.addFlashAttribute(registrationCommand);
//		
//		registrationCommand.getUser().setRole(userRole.getRole(registrationCommand.getUserRole()));
//		userService.saveUser(registrationCommand.getUser());
//		
//		//clear the command object from the session
//		status.setComplete();
//		return "redirect:/userSearchAdmin";
//	}
}
