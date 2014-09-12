package com.seaport.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang.time.DateFormatUtils;
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
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IGroupService;
import com.seaport.service.IMachineService;
import com.seaport.service.IManufacturerService;
import com.seaport.service.IPortService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingUtil;

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
	
	
	private static String MACHINE_FIELD_FILLER = "XXX";
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		//User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstants.USER_MODEL);
		MachineSearchCommand machineSearchCommand = new MachineSearchCommand();
		machineSearchCommand.setUserCountry(countryService.getContriesMap());
		machineSearchCommand.setUserPort(portService.getPortsMap());
		machineSearchCommand.setUserStevidor(stevidorService.getStevidorsMap());
		machineSearchCommand.setGroupMap(groupService.getGroupMap());
		machineSearchCommand.setManufacturerMap(manufacturerService.getManufacturerMap());
		machineSearchCommand.setYearMap(machineService.getYearMap());		
		//machineSearchCommand.setMachineList(machineService.getMachines(user, false));
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
//	@RequestMapping(value="/getMachines/", method = RequestMethod.GET)
//	@ResponseBody
//	public Map<String, Object[]> getModels(HttpServletRequest request, ModelMap model) throws Exception {
//		User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstants.USER_MODEL);
//		Collection<Machine> machineList = machineService.getMachines(user, false); 
//		return Collections.singletonMap("aaData", getJSONForMachine(machineList));
//	}	

	
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
	public List<Machine> getMachines(@PathVariable boolean getArchive,
			HttpServletRequest request) throws Exception {
		User user = (User)request.getSession().getAttribute(com.seaport.utils.VikingConstant.USER_MODEL);
		List<Machine> machineList = machineService.getMachines(user, getArchive); 
		return machineList;
	}
	
	/**
	 * 
	 * @param machineList
	 * @return
	 */
    public Object[] getJSONForMachine(Collection<Machine> machineList){
        Object[] rdArray = new Object[machineList.size()];
        int i = 0;
        
    	for (Machine machine : machineList) {
    		String groupName = "NULLя", modelName = "NULLя", stevidorFullName = "NULLя", modelDetail = "NULLя",
    		manufactorName = "NULLя", releaseYear = "NULLя", startDate = "NULLя", contractNum = "NULLя",
    		inventoryNumb = "NULLя", transNumb = "NULLя", factoryNumb = "NULLя", manufCountry = "NULLя",
    		location = "NULLя", portName = "NULLя", portCountry = "NULLя", nomNum =  "NULLя", regNum = "NULLя",
    		machineNote = "NULLя", groupId = "NULLя";
			
    		try {
    			releaseYear = machine.getReleaseYear()==null?" ":machine.getReleaseYear();
    			if (machine.getStartDate()!=null) {
    				startDate = DateFormatUtils.format(machine.getStartDate(), "yyyy/MM/dd");
				} else {
					startDate = MACHINE_FIELD_FILLER;
				}
    			contractNum = machine.getDoc()==null?MACHINE_FIELD_FILLER:machine.getDoc();
    			inventoryNumb = machine.getInventoryNumb() == null?MACHINE_FIELD_FILLER:machine.getInventoryNumb();
    			transNumb = machine.getTransNumb() == null?MACHINE_FIELD_FILLER:machine.getTransNumb();
    			factoryNumb = machine.getFactoryNumb() == null?MACHINE_FIELD_FILLER:machine.getFactoryNumb();
    			location = machine.getLocation() == null?MACHINE_FIELD_FILLER:machine.getLocation();
    			nomNum = machine.getNomNo() == null?MACHINE_FIELD_FILLER:machine.getNomNo();
    			regNum = machine.getRegNo() == null?MACHINE_FIELD_FILLER:machine.getRegNo();
    			machineNote = machine.getNote() == null?MACHINE_FIELD_FILLER:machine.getNote();

    			groupId = machine.getGroupId().toString();
			} catch (Exception e) {
			}
    		try {
    			if (machine.getMachineModel() == null) {
        			groupName = machine.getGroup().getName()+" <br/>Модель Отсутствует!";
        			modelName = machine.getName();
				} else {
	    			groupName = machine.getMachineModel().getGroup().getName();
	    			modelName = machine.getMachineModel().getName();
				}
    			modelDetail = machine.getMachineModel().getDetails() == null?MACHINE_FIELD_FILLER:machine.getMachineModel().getDetails();
    			manufactorName = machine.getMachineModel().getManufacturer().getNameRus()==null?MACHINE_FIELD_FILLER:machine.getMachineModel().getManufacturer().getNameRus();
    			manufCountry = machine.getMachineModel().getManufacturer().getCountry().getNameRus();
			} catch (Exception e) {
				
			}
    		
    		try {
    			stevidorFullName = machine.getStevidor().getFullName();
    			portName = machine.getStevidor().getPort().getName();
    			portCountry = machine.getStevidor().getPort().getCountry().getNameRus();
			} catch (Exception e) {
			}
    		
    		if (VikingUtil.isEmpty(groupName)) {
    			groupName = new String(MACHINE_FIELD_FILLER);
    		} else if (VikingUtil.isEmpty(modelName)){
    			modelName = new String(MACHINE_FIELD_FILLER);
    		} else if (VikingUtil.isEmpty(stevidorFullName)){
    			stevidorFullName = new String(MACHINE_FIELD_FILLER);
    		} else if (VikingUtil.isEmpty(modelDetail)){
    			modelDetail = new String(MACHINE_FIELD_FILLER);
    		} else if (VikingUtil.isEmpty(manufactorName)){
    			manufactorName = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(releaseYear)){
				releaseYear = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(startDate)){
				startDate = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(contractNum)){
				contractNum = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(inventoryNumb)){
				inventoryNumb = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(transNumb)){
				transNumb = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(factoryNumb)){
				factoryNumb = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(manufCountry)){
				manufCountry = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(location)){
				location = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(portName)){
				portName = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(portCountry)){
				portCountry = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(nomNum)){
				nomNum = new String(MACHINE_FIELD_FILLER);
			}
			if (VikingUtil.isEmpty(regNum)){
				regNum = new String(MACHINE_FIELD_FILLER);
			}
    		
			if (VikingUtil.isEmpty(machineNote)){
				machineNote = new String(MACHINE_FIELD_FILLER);
			} else if (VikingUtil.isEmpty(groupId)){
				groupId = new String(MACHINE_FIELD_FILLER);
			} 
    		
    		
            Object[] objectArray = new String[]{machine.getMachineId().toString(), machine.getMachineId().toString(), groupId, machine.getModelId()==null?MACHINE_FIELD_FILLER:machine.getModelId().toString(),
							            		groupName, modelName,
							            		stevidorFullName, portCountry, portName, modelDetail, manufactorName, releaseYear,
							            		startDate, contractNum, inventoryNumb, transNumb, factoryNumb,
							            		manufCountry, location, nomNum, regNum,
							            		machineNote, machine.getArchived()};
            
            rdArray[i] = objectArray;
            i++;           
		}
        return rdArray;
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
