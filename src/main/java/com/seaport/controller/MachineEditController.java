package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

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

import com.seaport.command.MachineEditCommand;
import com.seaport.service.IMachineService;
import com.seaport.service.IPortService;

/**
 * The Controller class that invoke business logic and create a Model&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/machineEdit")
@SessionAttributes("machineEditCommand")
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
		machineEditCommand.setManufacturerMap(machineService.getManufacturerMap());
		machineEditCommand.setYearMap(machineService.getYearMap());
		
		model.put("machineEditCommand", machineEditCommand);
		return "machineEdit";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model,
								@ModelAttribute("machineEditCommand") MachineEditCommand machineEditCommand,
								BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "machineSearch";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		machineService.saveMachine(machineEditCommand.getMachine());
		return "redirect:machineSearch";
	}
	
}





