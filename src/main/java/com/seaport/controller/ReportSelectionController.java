package com.seaport.controller;

import java.util.HashMap;
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
	
	private static String COMPANY_FILTER = "1";
	private static String GROUP_FILTER = "2";
	private static String MODEL_FILTER = "3";
	private static String YEAR_FILTER = "4";
	private static String MANUFACTOR_FILTER = "5";
	
	@RequestMapping(value="/company/", method = RequestMethod.GET)
	public String setupGroupReport(HttpServletRequest request, ModelMap model) throws Exception {
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "companyReport";
	}
	@RequestMapping(value="/group/", method = RequestMethod.GET)
	public String setupDynamicReport(HttpServletRequest request, ModelMap model)  throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "groupReport";
	}
	@RequestMapping(value="/manufacturer/", method = RequestMethod.GET)
	public String setupManufacturerReport(HttpServletRequest request, ModelMap model)  throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "manufacturerReport";
	}	
	@RequestMapping(value="/account/", method = RequestMethod.GET)
	public String setupCounReport(HttpServletRequest request, ModelMap model) throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "accountReport";
	}
	
	/**
	 * Request to generate company type report. 
	 * @param request
	 * @param model
	 * @param reportSelectionCommand
	 * @param result
	 * @param redirectAttributes
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/companyReport/", method = RequestMethod.POST) 
	public String groupReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		/*Populate report header parameters and set filter flags.*/
		Map<String, Boolean> filtersMap = setFilterValues(reportSelectionCommand);

		/*Populate model list for provided groupId*/
		reportSelectionCommand.setMachineModelMap(machineService.getModelsMap(reportSelectionCommand.getGroupId()));	
		/*Machine Report*/
		reportSelectionCommand.getCompanyReport().clear();
		reportSelectionCommand.setTotalMachineCount(Integer.valueOf(0));
		
		/*Check if report runs for all companies*/
		if (reportSelectionCommand.getStevidorSelection()[0].equalsIgnoreCase("0")) {
			for (Map.Entry<Integer, Stevidor> entry : reportSelectionCommand.getStevidorMap().entrySet()) {
				Stevidor stevidor = entry.getValue();
				populateCompanyReport(stevidor, filtersMap, reportSelectionCommand);
			}
		} else {
			for (int i = 0; i < reportSelectionCommand.getStevidorSelection().length; i++) {
				String stevedorId = reportSelectionCommand.getStevidorSelection()[i];
				Stevidor stevidor = reportSelectionCommand.getStevidorMap().get(Integer.parseInt(stevedorId));
				populateCompanyReport(stevidor, filtersMap, reportSelectionCommand);
			}
		}
		return "companyReport";
	}

	/*not implemented*/
	@RequestMapping(value="/groupReport/", method = RequestMethod.POST) 
	public String getGroupReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {

		/*Populate report header parameters and set filter flags.*/
		Map<String, Boolean> filtersMap = setFilterValues(reportSelectionCommand);
		/*For all groups.*/
		List<Machine> machineList =  machineService.getMachines();

		reportSelectionCommand.setMachineModelMap(machineService.getModelsMap(reportSelectionCommand.getGroupId()));	

		
//		SELECT b.group_id, b.name, COUNT(*) as count FROM machines a, groups b 
//		WHERE a.group_id = b.group_id
//		GROUP BY group_id ORDER BY count DESC;
//
//
//		SELECT b.group_id, b.name, COUNT(*) as count 
//		FROM machines a RIGHT JOIN groups b ON a.group_id = b.group_id
//		GROUP BY group_id ORDER BY group_id;
		
		//clear the command object from the session
//		status.setComplete();
		return "groupReport";
	}

	/*not implemented*/
	@RequestMapping(value="/manufacturerReport/", method = RequestMethod.POST) 
	public String getManufacturerReport(HttpServletRequest request, Model model, 
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
		return "manufacturerReport";
	}

	
	/**
	 * Request to generate group type report.
	 * @param request
	 * @param model
	 * @param reportSelectionCommand
	 * @param result
	 * @param redirectAttributes
	 * @param status
	 * @param response
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/accountReport/", method = RequestMethod.POST) 
	public String groupReport(HttpServletRequest request, Model model, 
								@ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status, 
								HttpServletResponse response, HttpServletRequest req) throws Exception {
		/*Empty report Map*/
		Map<String[], List<Machine>> groupReportMap = new HashMap<String[], List<Machine>>();
		
		/*Populate report header parameters and set filter flags.*/
		Map<String, Boolean> filtersMap = setFilterValues(reportSelectionCommand);

		/*For all groups.*/
		List<Machine> machineList =  machineService.getMachines();
		Map<Integer, Group> groupMap = reportSelectionCommand.getGroupMap();
		for (Map.Entry<Integer, Group> entry : groupMap.entrySet()) {
//			Group group = entry.getValue();
//			Integer countModels = 0;
//			List<Machine> machineListByGroup = new ArrayList<Machine>();
//			for (Machine machine : machineList) {
//				try {
//					if (group.getGroupId().equals(machine.getMachineModel().getGroupId())) {
//						machineListByGroup.add(machine);
//						countModels++;
//					}
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//			groupReportMap.put(new String[]{group.getName(), countModels.toString()}, machineListByGroup);
		}
		reportSelectionCommand.setAccountReportMap(groupReportMap);

		return "groupReport";
	}

	/**
	 * Populating company reports with data.
	 * @param stevidor
	 * @param filtersMap
	 * @param reportSelectionCommand
	 */
	private void populateCompanyReport(Stevidor stevidor, Map<String, Boolean> filtersMap, ReportSelectionCommand reportSelectionCommand) {
		Integer countNumber = 0;
		List<Machine> machineList = machineService.getMachineByStevedorId(stevidor.getStevidorId());
		
		for (Machine machine : machineList) {
			if (filtersMap.get(GROUP_FILTER)){
				if (machine.getMachineModel() == null || 
						!machine.getMachineModel().getGroupId().equals(reportSelectionCommand.getGroupId())) {
					continue;	
				}
			}
			if (filtersMap.get(MODEL_FILTER) && !machine.getModelId().equals(reportSelectionCommand.getModelId())) {
				continue;
			}
			if (filtersMap.get(YEAR_FILTER) && !machine.getReleaseYear().equals(reportSelectionCommand.getReleaseYear())) {
				continue;
			}
			if (filtersMap.get(MANUFACTOR_FILTER) && !machine.getMachineModel().getManufacturerId().equals(reportSelectionCommand.getManufacturerId())) {
				continue;
			}					
			countNumber++;
		}
		reportSelectionCommand.getCompanyReport().add(new String[]{stevidor.getFullName(), countNumber.toString()});
		reportSelectionCommand.setTotalMachineCount(reportSelectionCommand.getTotalMachineCount()+countNumber);
	}
	
	/**
	 * Setting filter maps for all reports request type (few get used for each report).
	 * @param reportSelectionCommand
	 */
	private void setFilterMaps(ReportSelectionCommand reportSelectionCommand){
		reportSelectionCommand.setUserCountry(userService.getContriesMap());
		reportSelectionCommand.setUserPort(portService.getPortsMap());
		reportSelectionCommand.setStevidorMap(portService.getStevidorsMap());
		reportSelectionCommand.setGroupMap(machineService.getGroupsMap());
		reportSelectionCommand.setManufacturerMap(machineService.getManufacturerMap());
		reportSelectionCommand.setYearMap(machineService.getYearMap());
		reportSelectionCommand.setStevidorSelection(new String[]{"0"});
	}
	
	/**
	 * Setting up map with set of filter flags.
	 * @param reportSelectionCommand
	 * @return
	 */
	private Map<String, Boolean> setFilterValues(ReportSelectionCommand reportSelectionCommand){
		Map<String, Boolean> filtersMap= new HashMap<String, Boolean>();
		 
		if (!reportSelectionCommand.getStevidorSelection()[0].equalsIgnoreCase("0")) {
			String [] companySelection = reportSelectionCommand.getStevidorSelection();
			String [] companyNames = new String[companySelection.length];
			for (int i = 0; i < companySelection.length; i++) {
				Stevidor stevidor = reportSelectionCommand.getStevidorMap().get(Integer.parseInt(companySelection[i]));
				companyNames[i] = stevidor.getFullName();
			}
			reportSelectionCommand.setCompanyNames(companyNames);
			filtersMap.put(COMPANY_FILTER, Boolean.TRUE);
		} else {
			filtersMap.put(COMPANY_FILTER, Boolean.FALSE);
		}

		if (reportSelectionCommand.getGroupId()!=null && reportSelectionCommand.getGroupId().intValue()!=0) {
			String groupName = reportSelectionCommand.getGroupMap().get(reportSelectionCommand.getGroupId()).getName();
			reportSelectionCommand.setGroupName(groupName);
			filtersMap.put(GROUP_FILTER, Boolean.TRUE);
		} else {
			filtersMap.put(GROUP_FILTER, Boolean.FALSE);
		}
		
		if (reportSelectionCommand.getModelId()!=null && reportSelectionCommand.getModelId().intValue()!=0) {
			MachineModel machineModel = machineService.getModel(reportSelectionCommand.getModelId());
			reportSelectionCommand.setModelName(machineModel.getName());
			filtersMap.put(MODEL_FILTER, Boolean.TRUE);
		} else {
			filtersMap.put(MODEL_FILTER, Boolean.FALSE);
		}
		
		if (reportSelectionCommand.getReleaseYear()!=null && !reportSelectionCommand.getReleaseYear().equalsIgnoreCase("")) {
			reportSelectionCommand.setRelYearName(reportSelectionCommand.getReleaseYear());
			filtersMap.put(YEAR_FILTER, Boolean.TRUE);
		} else {
			filtersMap.put(YEAR_FILTER, Boolean.FALSE);
		}
		
		if (reportSelectionCommand.getManufacturerId()!=null && reportSelectionCommand.getManufacturerId().intValue()!=0) {
			String manufactName = reportSelectionCommand.getManufacturerMap().get(reportSelectionCommand.getManufacturerId()).getNameRus();
			reportSelectionCommand.setManufactName(manufactName);
			filtersMap.put(MANUFACTOR_FILTER, Boolean.TRUE);
		} else {
			filtersMap.put(MANUFACTOR_FILTER, Boolean.FALSE);
		}
		
		return filtersMap;
	}
}
