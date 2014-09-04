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
import com.seaport.service.ICountryService;
import com.seaport.service.IGroupService;
import com.seaport.service.IMachineService;
import com.seaport.service.IPortService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingConstants;

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
	private IGroupService groupService;
	@Autowired
	private IReportDAO reportDAO;
	@Autowired
	private IMachineService machineService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IStevidorService stevidorService;
	
	/**
	 * Loads company report page
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/company/", method = RequestMethod.GET)
	public String setupGroupReport(HttpServletRequest request, ModelMap model) throws Exception {
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "companyReport";
	}
	
	/**
	 * Loads group report page
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/group/", method = RequestMethod.GET)
	public String setupDynamicReport(HttpServletRequest request, ModelMap model)  throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "groupReport";
	}
	/**
	 * Loads manufacturer report page
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/manufacturer/", method = RequestMethod.GET)
	public String setupManufacturerReport(HttpServletRequest request, ModelMap model)  throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "manufacturerReport";
	}	
	/**
	 * Load account report page
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/account/", method = RequestMethod.GET)
	public String setupCounReport(HttpServletRequest request, ModelMap model) throws Exception{
		ReportSelectionCommand reportSelectionCommand = new ReportSelectionCommand();
		setFilterMaps(reportSelectionCommand);
		
		model.put("reportSelectionCommand", reportSelectionCommand);
		return "accountReport";
	}
	
	/**
     * Gets company reports DTO list from the service and send to the client as JSON formatted object array
     * compatible with datatables.net
     * 
	 * @param request
	 * @param model
	 * @param reportSelectionCommand
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getCompanyReport/", method = RequestMethod.GET)
	@ResponseBody
	public List<CompanyReportDTO> getCompanyReport(HttpServletRequest request, ModelMap model, 
					@ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand) throws Exception {
		/*Populate map with filter flag - value pair.*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);		
		List<CompanyReportDTO> groupReportDTOs  = reportDAO.getCompanyReportDTOs(filtersMap);
		return groupReportDTOs;
	}

	/**
	 * Get group report
	 * @param request
	 * @param model
	 * @param reportSelectionCommand
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getGroupReport/", method = RequestMethod.GET)
	@ResponseBody
	public List<GroupReportDTO> groupReport(HttpServletRequest request, Model model, 
					@ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand) throws Exception {

		/*Populate map with filter flag - value pair.*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);
		List<GroupReportDTO> groupReportDTOs  = reportDAO.getGroupReportDTOs(filtersMap);
		return groupReportDTOs;
	}

	/**
	 * Get manufacturer Report
	 * @param request
	 * @param model
	 * @param reportSelectionCommand
	 * @param result
	 * @param redirectAttributes
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getManufacturerReport/", method = RequestMethod.GET)
	@ResponseBody
	public List<ManufacturerReportDTO> getManufacturerReport(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("reportSelectionCommand") ReportSelectionCommand reportSelectionCommand,
								BindingResult result, RedirectAttributes redirectAttributes, SessionStatus status) throws Exception {
		
		/*Populate map with .*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);
		List<ManufacturerReportDTO> manufacturerReportDTOs  = reportDAO.getManufacturerReportDTOs(filtersMap);
		return manufacturerReportDTOs;
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
		Map<String[], List<Machine>> accountReportMap = new HashMap<String[], List<Machine>>();
		
		/*Populate map with filter flag - value pair.*/
		Map<String, Object> filtersMap = setFilterValues(reportSelectionCommand);	
		
		/*Get machines by stevidor.*/
		Integer stevidorId = (Integer)filtersMap.get(VikingConstants.COMPANY_SINGLE_FILTER);
		List<Machine> machineList =  machineService.getMachineByStevedorId(stevidorId);

		Map<Integer, Group> groupMap = new HashMap<Integer, Group>();
		if (filtersMap.containsKey(VikingConstants.GROUP_FILTER)) {
			Integer groupId = (Integer)filtersMap.get(VikingConstants.GROUP_FILTER);
			groupMap.put(groupId, reportSelectionCommand.getGroupMap().get(groupId));
		} else {
			groupMap = reportSelectionCommand.getGroupMap();
		}

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
			accountReportMap.put(new String[]{group.getName(), countModels.toString()}, machineListByGroup);
		}
		reportSelectionCommand.setAccountReportMap(accountReportMap);

		return "accountReport";
	}

	/**
	 * Setting filter maps for all reports request type (few get used for each report).
	 * @param reportSelectionCommand
	 */
	private void setFilterMaps(ReportSelectionCommand reportSelectionCommand){
		reportSelectionCommand.setUserCountry(countryService.getContriesMap());
		reportSelectionCommand.setUserPort(portService.getPortsMap());
		reportSelectionCommand.setStevidorMap(stevidorService.getStevidorsMap());
		reportSelectionCommand.setGroupMap(groupService.getGroupMap());
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
			filtersMap.put(VikingConstants.COMPANY_MULTI_FILTER, reportSelectionCommand.getStevidorSelection());
		}
		if (reportSelectionCommand.getStevidorId()!=null && reportSelectionCommand.getStevidorId().intValue()!=0) {
			filtersMap.put(VikingConstants.COMPANY_SINGLE_FILTER, reportSelectionCommand.getStevidorId());
		} 
		if (reportSelectionCommand.getGroupId()!=null && reportSelectionCommand.getGroupId().intValue()!=0) {
			filtersMap.put(VikingConstants.GROUP_FILTER, reportSelectionCommand.getGroupId());
		} 
		if (reportSelectionCommand.getModelId()!=null && reportSelectionCommand.getModelId().intValue()!=0) {
			filtersMap.put(VikingConstants.MODEL_FILTER, reportSelectionCommand.getModelId());
		}
		
		if (reportSelectionCommand.getReleaseStartYear()!=null && !reportSelectionCommand.getReleaseStartYear().equalsIgnoreCase("")) {
			filtersMap.put(VikingConstants.YEAR_START_FILTER, reportSelectionCommand.getReleaseStartYear());
		}  

		if (reportSelectionCommand.getReleaseEndYear()!=null && !reportSelectionCommand.getReleaseEndYear().equalsIgnoreCase("")) {
			filtersMap.put(VikingConstants.YEAR_END_FILTER, reportSelectionCommand.getReleaseEndYear());
		}  
		
		if (reportSelectionCommand.getManufacturerId()!=null && reportSelectionCommand.getManufacturerId().intValue()!=0) {
			filtersMap.put(VikingConstants.MANUFACTOR_FILTER, reportSelectionCommand.getManufacturerId());
		} 
		
		return filtersMap;
	}
	
	/*do not remove code below!*//*do not remove code below!*//*do not remove code below!*/
//	@RequestMapping(value = "/{app}/conf/{fnm}", method=RequestMethod.GET)
//	public ResponseEntity<?> getConf(@PathVariable("app") String app, @PathVariable("fnm") String fnm) {
//	   log.debug("AppName:" + app);
//	   log.debug("fName:" + fnm);
//	           ...
//	           return ...
//	  }
}
