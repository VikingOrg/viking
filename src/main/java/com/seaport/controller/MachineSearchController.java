package com.seaport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.MachineSearchCommand;
import com.seaport.domain.Machine;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Stevidor;
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IGroupService;
import com.seaport.service.IMachineService;
import com.seaport.service.IManufacturerService;
import com.seaport.service.IPortService;
import com.seaport.service.IStevidorService;
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
	private IStevidorService stevidorService;
	@Autowired
	private IMachineService machineService;
	@Autowired
	private IGroupService groupService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IPortService portService;
	@Autowired
	private IManufacturerService manufacturerService;	

	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		MachineSearchCommand machineSearchCommand = new MachineSearchCommand();
		machineSearchCommand.setUserCountry(countryService.getContriesMap());
		machineSearchCommand.setUserPort(portService.getPortsMap());
		machineSearchCommand.setUserStevidor(stevidorService.getStevidorsMap());
		machineSearchCommand.setGroupMap(groupService.getGroupMap());
		machineSearchCommand.setManufacturerMap(manufacturerService.getManufacturerMap());
		machineSearchCommand.setYearMap(machineService.getYearMap());
		machineSearchCommand.setArchived("A");
		
//		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
//		  if (inputFlashMap != null) {
//			  Machine lastMachine = (Machine) inputFlashMap.get("lastMachine");
//			  machineSearchCommand.setLastMachine(lastMachine);
//		}
		
		Machine lastMachine = (Machine) model.get("lastMachine");
		machineSearchCommand.setLastMachine(lastMachine);
		model.put("machineSearchCommand", machineSearchCommand);
		return "machineSearch";
	}
	
	/**
     * Fetch a the machine list from the service, and package up into a Map that is
     * compatible with datatables.net
	 * @param groupId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getMachines/{getArchive}", method = RequestMethod.GET)
	@ResponseBody
	public List<Machine> getMachines(@PathVariable String getArchive,
			HttpServletRequest request) throws Exception {
		User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstant.USER_MODEL);
		List<Machine> machineList = machineService.getMachines(user, getArchive); 
		return machineList;
	}
	
	
	/**
	 * JSON formatted response of Stevidors. 
	 * @param groupId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getStevidors/{portId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Stevidor> getStevidors(@PathVariable Integer portId, ModelMap model) throws Exception {
		List<Stevidor> stevidorList = stevidorService.getStevidors(portId);
		return stevidorList;
	}	
	
    /**
     * Using for machine delete functionality. Nothing else get submitted from machine search page.
     * @param request
     * @param model
     * @param machineSearchCommand
     * @param result
     * @param redirectAttributes
     * @return
     * @throws Exception
     */
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model,
								@Valid @ModelAttribute("machineSearchCommand") MachineSearchCommand machineSearchCommand,
								BindingResult result, RedirectAttributes redirectAttributes) throws Exception {

		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "machineSearch";
		}
		String[] machineSelection = machineSearchCommand.getMachineSelection();
		for (int i = 0; i < machineSelection.length; i++) {
			Machine machine = machineService.getMachine(Integer.parseInt(machineSelection[i]));
			machine.setArchived("Y");
			machineService.saveMachine(machine);
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		return "redirect:machineSearch";
	}
}
