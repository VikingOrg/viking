package com.seaport.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.ReportSelectionCommand;
import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Stevidor;
import com.seaport.service.IMachineService;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/15/14 <P>
 */

@Controller
@RequestMapping("/reportSelection")
@SessionAttributes("reportSelectionCommand")
public class ReportSelectionController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortService portService;
	@Autowired
	private IMachineService machineService;	

	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, ModelMap model) throws Exception {
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		reportSelectionCommand.setUserCountry(userService.getContriesMap());
		reportSelectionCommand.setUserPort(portService.getPortsMap());
		reportSelectionCommand.setStevidorMap(portService.getStevidorsMap());
//		Map<Integer, Group> mapInteger = machineService.getGroupsMap();
//		for (Map.Entry<Integer, Group> entry : mapInteger.entrySet()) {
//			Integer key = entry.getKey();
//			Group value = entry.getValue();
//			Long l = ((Number) key).longValue();
//			reportSelectionCommand.getGroupMap().put(l, value);
//		}
		reportSelectionCommand.setGroupMap(machineService.getGroupsMap());
		reportSelectionCommand.setManufacturerMap(machineService.getManufacturerMap());
		reportSelectionCommand.setYearMap(machineService.getYearMap());		
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "reportSelection";
	}
	
	@RequestMapping(value="/groupReport/", method = RequestMethod.POST) 
	public String groupReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		redirectAttributes.addFlashAttribute(reportSelectionCommand);
		/*Settings parameter name for report header.*/
		String groupName = reportSelectionCommand.getGroupMap().get(reportSelectionCommand.getGroupId()).getName();
		reportSelectionCommand.setGroupName(groupName);
		MachineModel machineModel = machineService.getModel(reportSelectionCommand.getModelId());
		reportSelectionCommand.setModelName(machineModel.getName());
		reportSelectionCommand.setRelYearName(Integer.toString(reportSelectionCommand.getReleaseYear()));
		String manufactName = reportSelectionCommand.getManufacturerMap().get(reportSelectionCommand.getManufacturerId()).getName();
		reportSelectionCommand.setManufactName(manufactName);
		reportSelectionCommand.setMachineModelMap(machineService.getModelsMap(reportSelectionCommand.getGroupId()));	
		/*Company(Group) Report*/
		reportSelectionCommand.getCompanyReport().clear();
		for (int i = 0; i < reportSelectionCommand.getStevidorSelection().length; i++) {
			String stevedorId = reportSelectionCommand.getStevidorSelection()[i];
			Stevidor stevidor = reportSelectionCommand.getStevidorMap().get(Integer.parseInt(stevedorId));
			Integer countNumber = 0;
			List<Machine> machineList = machineService.getMachineByStevedorId(stevidor.getStevidorId());
			for (Machine machine : machineList) {
				countNumber++;
			}
			reportSelectionCommand.getCompanyReport().add(new String[]{stevidor.getName(), countNumber.toString()});
		}
		
		return "reportSelection";
	}
	
	/*not implemented*/
	@RequestMapping(value="/dymamicReport/", method = RequestMethod.POST) 
	public String dynamicReport(HttpServletRequest request, Model model, 
								@ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status, 
								HttpServletResponse response, HttpServletRequest req) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "reportSelection";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		redirectAttributes.addFlashAttribute(reportSelectionCommand);
		return "../reportSelection";
	}
	
	/*not implemented*/
	@RequestMapping(value="/countReport/", method = RequestMethod.POST) 
	public String countReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "reportSelection";
		}
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		redirectAttributes.addFlashAttribute(reportSelectionCommand);
		
		//clear the command object from the session
//		status.setComplete();
		return "reportSelection";
	}
}
