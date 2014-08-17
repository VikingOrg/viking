package com.seaport.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.ReportSelectionCommand;
import com.seaport.dao.IReportDAO;
import com.seaport.domain.Group;
import com.seaport.domain.Machine;
import com.seaport.dto.CompanyReportDTO;
import com.seaport.dto.GroupReportDTO;
import com.seaport.dto.ManufacturerReportDTO;
import com.seaport.service.IMachineService;
import com.seaport.service.IPortService;
import com.seaport.service.IUserService;
import com.seaport.utils.SystemConstants;

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
	@Autowired
	private IReportDAO reportDAO;
	
	
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
     * Fetch a the machine list from the service, and package up into a Map that is
     * compatible with datatables.net
	 * @param groupId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCompanyReport/", method = RequestMethod.GET)
	@ResponseBody
	public List<CompanyReportDTO> getCompanyReport(HttpServletRequest request, ModelMap model, 
					@ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand) throws Exception {
		/*Populate map with .*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);		
		List<CompanyReportDTO> groupReportDTOs  = reportDAO.getCompanyReportDTOs(filtersMap);
		return groupReportDTOs;
	}

	/*do not remove code below!*/
//	@RequestMapping(value = "/{app}/conf/{fnm}", method=RequestMethod.GET)
//	public ResponseEntity<?> getConf(@PathVariable("app") String app, @PathVariable("fnm") String fnm) {
//	   log.debug("AppName:" + app);
//	   log.debug("fName:" + fnm);
//	           ...
//	           return ...
//	  }
	
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
	public String companyReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		/*Populate report header parameters and set filter flags - obsolete!.*/
//		setFilterValuesAndTitle(reportSelectionCommand);
		
		/*Populate map with .*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);
		List<CompanyReportDTO> groupReportDTOs  = reportDAO.getCompanyReportDTOs(filtersMap);
		reportSelectionCommand.setCompanyReportList(groupReportDTOs);	
		
		/*Populate model list for provided groupId*/
//		reportSelectionCommand.setMachineModelMap(machineService.getModelsMap(reportSelectionCommand.getGroupId()));	
//		/*Machine Report*/
//		reportSelectionCommand.getCompanyReportList().clear();
//		reportSelectionCommand.setTotalMachineCount(Integer.valueOf(0));
//		
//		/*Check if report runs for all companies*/
//		if (reportSelectionCommand.getStevidorSelection()[0].equalsIgnoreCase("0")) {
//			for (Map.Entry<Integer, Stevidor> entry : reportSelectionCommand.getStevidorMap().entrySet()) {
//				Stevidor stevidor = entry.getValue();
//				populateCompanyReport(stevidor, filtersMap, reportSelectionCommand);
//			}
//		} else {
//			for (int i = 0; i < reportSelectionCommand.getStevidorSelection().length; i++) {
//				String stevedorId = reportSelectionCommand.getStevidorSelection()[i];
//				Stevidor stevidor = reportSelectionCommand.getStevidorMap().get(Integer.parseInt(stevedorId));
//				populateCompanyReport(stevidor, filtersMap, reportSelectionCommand);
//			}
//		}
		return "companyReport";
	}

	/*not implemented*/
	@RequestMapping(value="/groupReport/", method = RequestMethod.POST) 
	public String groupReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {

		
		/*Populate map with .*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);
		List<GroupReportDTO> groupReportDTOs  = reportDAO.getGroupReportDTOs(filtersMap);
		reportSelectionCommand.setGroupReportList(groupReportDTOs);		
		
		//clear the command object from the session
//		status.setComplete();
		return "groupReport";
	}

	/*not implemented*/
	@RequestMapping(value="/manufacturerReport/", method = RequestMethod.POST) 
	public String getManufacturerReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		/*Populate map with .*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);
		List<ManufacturerReportDTO> manufacturerReportDTOs  = reportDAO.getManufacturerReportDTOs(filtersMap);
		reportSelectionCommand.setManufacturerReportLsit(manufacturerReportDTOs);	
		
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
	public String accountReport(HttpServletRequest request, Model model, 
								@ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status, 
								HttpServletResponse response, HttpServletRequest req) throws Exception {
		/*Empty report Map*/
		Map<String[], List<Machine>> groupReportMap = new HashMap<String[], List<Machine>>();
		
		/*Populate report header parameters and set filter flags.*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);
		
		/*For all groups.*/
		List<Machine> machineList =  machineService.getMachines();
		Map<Integer, Group> groupMap = reportSelectionCommand.getGroupMap();
		for (Map.Entry<Integer, Group> entry : groupMap.entrySet()) {
			Group group = entry.getValue();
			Integer countModels = 0;
			List<Machine> machineListByGroup = new ArrayList<Machine>();
			for (Machine machine : machineList) {
				try {
					if (group.getGroupId().equals(machine.getGroupId())) {
						machineListByGroup.add(machine);
						countModels++;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			groupReportMap.put(new String[]{group.getName(), countModels.toString()}, machineListByGroup);
		}
		reportSelectionCommand.setAccountReportMap(groupReportMap);

		return "accountReport";
	}

	/**
	 * Populating company reports with data.
	 * @param stevidor
	 * @param filtersMap
	 * @param reportSelectionCommand
	 */
//	private void populateCompanyReport(Stevidor stevidor, Map<String, Boolean> filtersMap, ReportSelectionCommand reportSelectionCommand) {
//		Integer countNumber = 0;
//		List<Machine> machineList = machineService.getMachineByStevedorId(stevidor.getStevidorId());
//		
//		for (Machine machine : machineList) {
//			if (filtersMap.get(GROUP_FILTER)){
//				if (machine.getMachineModel() == null || 
//						!machine.getMachineModel().getGroupId().equals(reportSelectionCommand.getGroupId())) {
//					continue;	
//				}
//			}
//			if (filtersMap.get(MODEL_FILTER) && !machine.getModelId().equals(reportSelectionCommand.getModelId())) {
//				continue;
//			}
//			if (filtersMap.get(YEAR_FILTER) && !machine.getReleaseYear().equals(reportSelectionCommand.getReleaseYear())) {
//				continue;
//			}
//			if (filtersMap.get(MANUFACTOR_FILTER) && !machine.getMachineModel().getManufacturerId().equals(reportSelectionCommand.getManufacturerId())) {
//				continue;
//			}					
//			countNumber++;
//		}
//		reportSelectionCommand.getCompanyReportList().add(new String[]{stevidor.getFullName(), countNumber.toString()});
//		reportSelectionCommand.setTotalMachineCount(reportSelectionCommand.getTotalMachineCount()+countNumber);
//	}
	
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
	 * Setting up map with set of filter values.
	 * @param reportSelectionCommand
	 * @return
	 */
	private Map<String, Object> setFilterValues(ReportSelectionCommand reportSelectionCommand){
		Map<String, Object> filtersMap= new HashMap<String, Object>();
		/*Company Filter (value) pair.*/ 
		if (!reportSelectionCommand.getStevidorSelection()[0].equalsIgnoreCase("0")) {
			filtersMap.put(SystemConstants.COMPANY_MULTI_FILTER, reportSelectionCommand.getStevidorSelection());
		}
		if (reportSelectionCommand.getStevidorId()!=null && reportSelectionCommand.getStevidorId().intValue()!=0) {
			filtersMap.put(SystemConstants.COMPANY_SINGLE_FILTER, reportSelectionCommand.getStevidorId());
		} 
		if (reportSelectionCommand.getGroupId()!=null && reportSelectionCommand.getGroupId().intValue()!=0) {
			filtersMap.put(SystemConstants.GROUP_FILTER, reportSelectionCommand.getGroupId());
		} 
		if (reportSelectionCommand.getModelId()!=null && reportSelectionCommand.getModelId().intValue()!=0) {
			filtersMap.put(SystemConstants.MODEL_FILTER, reportSelectionCommand.getModelId());
		}
		
		if (reportSelectionCommand.getReleaseStartYear()!=null && !reportSelectionCommand.getReleaseStartYear().equalsIgnoreCase("")) {
			filtersMap.put(SystemConstants.YEAR_START_FILTER, reportSelectionCommand.getReleaseStartYear());
		}  

		if (reportSelectionCommand.getReleaseEndYear()!=null && !reportSelectionCommand.getReleaseEndYear().equalsIgnoreCase("")) {
			filtersMap.put(SystemConstants.YEAR_END_FILTER, reportSelectionCommand.getReleaseEndYear());
		}  
		
		if (reportSelectionCommand.getManufacturerId()!=null && reportSelectionCommand.getManufacturerId().intValue()!=0) {
			filtersMap.put(SystemConstants.MANUFACTOR_FILTER, reportSelectionCommand.getManufacturerId());
		} 
		
		return filtersMap;
	}
	
//	/**
//	 * Setting up map with set of filter flags.
//	 * @param reportSelectionCommand
//	 * @return
//	 */
//	private Map<String, Boolean> setFilterValuesAndTitle(ReportSelectionCommand reportSelectionCommand){
//		Map<String, Boolean> filtersMap= new HashMap<String, Boolean>();
//		 
//		if (!reportSelectionCommand.getStevidorSelection()[0].equalsIgnoreCase("0")) {
//			String [] companySelection = reportSelectionCommand.getStevidorSelection();
//			String [] companyNames = new String[companySelection.length];
//			for (int i = 0; i < companySelection.length; i++) {
//				Stevidor stevidor = reportSelectionCommand.getStevidorMap().get(Integer.parseInt(companySelection[i]));
//				companyNames[i] = stevidor.getFullName();
//			}
//			reportSelectionCommand.setCompanyNames(companyNames);
//			filtersMap.put(COMPANY_FILTER, Boolean.TRUE);
//		} else {
//			filtersMap.put(COMPANY_FILTER, Boolean.FALSE);
//		}
//
//		if (reportSelectionCommand.getGroupId()!=null && reportSelectionCommand.getGroupId().intValue()!=0) {
//			String groupName = reportSelectionCommand.getGroupMap().get(reportSelectionCommand.getGroupId()).getName();
//			reportSelectionCommand.setGroupName(groupName);
//			filtersMap.put(GROUP_FILTER, Boolean.TRUE);
//		} else {
//			filtersMap.put(GROUP_FILTER, Boolean.FALSE);
//		}
//		
//		if (reportSelectionCommand.getModelId()!=null && reportSelectionCommand.getModelId().intValue()!=0) {
//			MachineModel machineModel = machineService.getModel(reportSelectionCommand.getModelId());
//			reportSelectionCommand.setModelName(machineModel.getName());
//			filtersMap.put(MODEL_FILTER, Boolean.TRUE);
//		} else {
//			filtersMap.put(MODEL_FILTER, Boolean.FALSE);
//		}
//		
//		if (reportSelectionCommand.getReleaseYear()!=null && !reportSelectionCommand.getReleaseYear().equalsIgnoreCase("")) {
//			reportSelectionCommand.setRelYearName(reportSelectionCommand.getReleaseYear());
//			filtersMap.put(YEAR_FILTER, Boolean.TRUE);
//		} else {
//			filtersMap.put(YEAR_FILTER, Boolean.FALSE);
//		}
//		
//		if (reportSelectionCommand.getManufacturerId()!=null && reportSelectionCommand.getManufacturerId().intValue()!=0) {
//			String manufactName = reportSelectionCommand.getManufacturerMap().get(reportSelectionCommand.getManufacturerId()).getNameRus();
//			reportSelectionCommand.setManufactName(manufactName);
//			filtersMap.put(MANUFACTOR_FILTER, Boolean.TRUE);
//		} else {
//			filtersMap.put(MANUFACTOR_FILTER, Boolean.FALSE);
//		}
//		
//		return filtersMap;
//	}
}
