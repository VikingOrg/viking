package com.seaport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.MachineSearchCommand;
import com.seaport.domain.Machine;
import com.seaport.domain.User;
import com.seaport.service.IMachineService;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/machineSearch")
@SessionAttributes("machineSearchCommand")
public class MachineSearchController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortService portService;
	@Autowired
	private IMachineService machineService;	
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		User user = (User)request.getSession().getAttribute(com.seaport.utils.SystemConstants.USER_MODEL);
		MachineSearchCommand machineSearchCommand = new MachineSearchCommand();
		machineSearchCommand.setUserCountry(userService.getContriesMap());
		machineSearchCommand.setUserPort(portService.getPortsMap());
		machineSearchCommand.setUserStevidor(portService.getStevidorsMap());
		machineSearchCommand.setGroupMap(machineService.getGroupsMap());
		machineSearchCommand.setManufacturerMap(machineService.getManufacturerMap());
		machineSearchCommand.setYearMap(machineService.getYearMap());		
		machineSearchCommand.setMachineList(machineService.getMachines(user));
		model.put("machineSearchCommand", machineSearchCommand);
		return "machineSearch";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model,
								@Valid @ModelAttribute("machineSearchCommand") MachineSearchCommand machineSearchCommand,
								BindingResult result, RedirectAttributes redirectAttributes) throws Exception {

		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "machineSearch";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		List<Machine> machineList = machineSearchCommand.getMachineList();
		for (Machine machine : machineList) {
			if (machine.getArchived()!=null && machine.getArchived().equalsIgnoreCase("Y")) {
				machineService.saveMachine(machine);	
			}
		}
		return "machineSearch";
	}
}
