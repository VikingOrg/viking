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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.ReportSelectionCommand;
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

	@RequestMapping(value="/company/", method = RequestMethod.GET)
	public String setupGroupReport(HttpServletRequest request, ModelMap model) throws Exception {
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		reportSelectionCommand.setUserCountry(userService.getContriesMap());
		reportSelectionCommand.setUserPort(portService.getPortsMap());
		reportSelectionCommand.setStevidorMap(portService.getStevidorsMap());

		reportSelectionCommand.setGroupMap(machineService.getGroupsMap());
		reportSelectionCommand.setManufacturerMap(machineService.getManufacturerMap());
		reportSelectionCommand.setYearMap(machineService.getYearMap());
		reportSelectionCommand.setStevidorSelection(new String[]{"0"});
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "companyReport";
	}
	@RequestMapping(value="/group/", method = RequestMethod.GET)
	public String setupDynamicReport(HttpServletRequest request, ModelMap model)  throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		reportSelectionCommand.setUserCountry(userService.getContriesMap());
		reportSelectionCommand.setUserPort(portService.getPortsMap());
		reportSelectionCommand.setStevidorMap(portService.getStevidorsMap());

		reportSelectionCommand.setGroupMap(machineService.getGroupsMap());
		reportSelectionCommand.setManufacturerMap(machineService.getManufacturerMap());
		reportSelectionCommand.setYearMap(machineService.getYearMap());
		reportSelectionCommand.setStevidorSelection(new String[]{"0"});
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "groupReport";
	}
	@RequestMapping(value="/account/", method = RequestMethod.GET)
	public String setupCounReport(HttpServletRequest request, ModelMap model) throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		reportSelectionCommand.setUserCountry(userService.getContriesMap());
		reportSelectionCommand.setUserPort(portService.getPortsMap());
		reportSelectionCommand.setStevidorMap(portService.getStevidorsMap());

		reportSelectionCommand.setGroupMap(machineService.getGroupsMap());
		reportSelectionCommand.setManufacturerMap(machineService.getManufacturerMap());
		reportSelectionCommand.setYearMap(machineService.getYearMap());
		reportSelectionCommand.setStevidorSelection(new String[]{"0"});
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "accountReport";
	}
	@RequestMapping(value="/companyReport/", method = RequestMethod.POST) 
	public String groupReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		
//		if (reportSelectionCommand.getStevidorSelection().length == 0) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "reportSelection";
//		}
//		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
//		redirectAttributes.addFlashAttribute(reportSelectionCommand);
		boolean groupFilterSet = false;
		boolean modelFilterSet = false;
		boolean relYearFilterSet = false;
		boolean manufactFilterSet = false;
		
		/*Settings parameter name for report header.*/
		if (reportSelectionCommand.getGroupId()!=null && reportSelectionCommand.getGroupId().intValue()!=0) {
			String groupName = reportSelectionCommand.getGroupMap().get(reportSelectionCommand.getGroupId()).getName();
			reportSelectionCommand.setGroupName(groupName);
			groupFilterSet = true;
		}
		if (reportSelectionCommand.getModelId()!=null && reportSelectionCommand.getModelId().intValue()!=0) {
			MachineModel machineModel = machineService.getModel(reportSelectionCommand.getModelId());
			reportSelectionCommand.setModelName(machineModel.getName());
			modelFilterSet = true;
		}
		if (reportSelectionCommand.getReleaseYear()!=null && !reportSelectionCommand.getReleaseYear().equalsIgnoreCase("")) {
			reportSelectionCommand.setRelYearName(reportSelectionCommand.getReleaseYear());
			relYearFilterSet = true;
		}
		if (reportSelectionCommand.getManufacturerId()!=null && reportSelectionCommand.getManufacturerId().intValue()!=0) {
			String manufactName = reportSelectionCommand.getManufacturerMap().get(reportSelectionCommand.getManufacturerId()).getName();
			reportSelectionCommand.setManufactName(manufactName);
			manufactFilterSet = true;
		}
		/*Populate model list for provided groupId*/
		reportSelectionCommand.setMachineModelMap(machineService.getModelsMap(reportSelectionCommand.getGroupId()));	
		/*Machine Report*/
		reportSelectionCommand.getCompanyReport().clear();
		reportSelectionCommand.setTotalMachineCount(Integer.valueOf(0));
		
		/*Check if report runs for all companies*/
		if (reportSelectionCommand.getStevidorSelection()[0].equalsIgnoreCase("0")) {
			for (Map.Entry<Integer, Stevidor> entry : reportSelectionCommand.getStevidorMap().entrySet()) {
				Stevidor stevidor = entry.getValue();
				Integer countNumber = 0;
				List<Machine> machineList = machineService.getMachineByStevedorId(stevidor.getStevidorId());
				for (Machine machine : machineList) {
					if (groupFilterSet){
						if (machine.getMachineModel() == null || 
								!machine.getMachineModel().getGroupId().equals(reportSelectionCommand.getGroupId())) {
							continue;	
						}
					}
					if (modelFilterSet && !machine.getModelId().equals(reportSelectionCommand.getModelId())) {
						continue;
					}
					if (relYearFilterSet && !machine.getReleaseYear().equals(reportSelectionCommand.getReleaseYear())) {
						continue;
					}
					if (manufactFilterSet && !machine.getMachineModel().getManufacturerId().equals(reportSelectionCommand.getManufacturerId())) {
						continue;
					}					
					countNumber++;
				}
				reportSelectionCommand.getCompanyReport().add(new String[]{stevidor.getFullName(), countNumber.toString()});
				reportSelectionCommand.setTotalMachineCount(reportSelectionCommand.getTotalMachineCount()+countNumber);
			}
		} else {
			for (int i = 0; i < reportSelectionCommand.getStevidorSelection().length; i++) {
				String stevedorId = reportSelectionCommand.getStevidorSelection()[i];
				Stevidor stevidor = reportSelectionCommand.getStevidorMap().get(Integer.parseInt(stevedorId));
				Integer countNumber = 0;
				List<Machine> machineList = machineService.getMachineByStevedorId(stevidor.getStevidorId());
				for (Machine machine : machineList) {
					if (groupFilterSet){
						if (machine.getMachineModel() == null || 
								!machine.getMachineModel().getGroupId().equals(reportSelectionCommand.getGroupId())) {
							continue;	
						}
					}
					if (modelFilterSet && !machine.getModelId().equals(reportSelectionCommand.getModelId())) {
						continue;
					}
					if (relYearFilterSet && !machine.getReleaseYear().equals(reportSelectionCommand.getReleaseYear())) {
						continue;
					}
					if (manufactFilterSet && !machine.getMachineModel().getManufacturerId().equals(reportSelectionCommand.getManufacturerId())) {
						continue;
					}					
					countNumber++;
				}
				reportSelectionCommand.getCompanyReport().add(new String[]{stevidor.getFullName(), countNumber.toString()});
				reportSelectionCommand.setTotalMachineCount(reportSelectionCommand.getTotalMachineCount()+countNumber);
			}
		}
		return "groupReport";
	} 	

	
	/*not implemented*/
	@RequestMapping(value="/dynamicReport/", method = RequestMethod.POST) 
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
