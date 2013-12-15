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

import com.seaport.command.BlankCommand;
import com.seaport.command.MachineEditCommand;
import com.seaport.service.IMachineService;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a Model&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/machineEdit")
public class MachineEditController {

	@Autowired
	private IPortService portService;
	@Autowired
	private IMachineService machineService;	
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		MachineEditCommand machineEditCommand = new MachineEditCommand();
		
		String machineId = request.getParameter("machineId");
		if (machineId != null) {
			machineEditCommand.setMachine(machineService.getMachine(Integer.parseInt(machineId))); 
			
			if (request.getParameter("copy")!= null) {
				machineEditCommand.setFormType("C");
				machineEditCommand.getMachine().setMachineId(null);
			} else {
				machineEditCommand.setFormType("E");
			}
		}
		
		machineEditCommand.setGroupMap(machineService.getGroupsMap());
		machineEditCommand.setStevidorMap(portService.getStevidorsMap());
		
		model.put("machineEditCommand", machineEditCommand);
		return "machineEdit";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public ModelAndView onSubmit(HttpServletRequest request, 
								@ModelAttribute BlankCommand blankCommand,
								BindingResult result) {

//		return new ModelAndView("redirect:nextViewHere", result.getModel());
		return new ModelAndView("machineEdit", result.getModel());
	}
}
