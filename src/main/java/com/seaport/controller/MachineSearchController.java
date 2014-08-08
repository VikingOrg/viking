package com.seaport.controller;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang.time.DateFormatUtils;
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
	
	/**
     * Fetch a the machine list from the service, and package up into a Map that is
     * compatible with datatables.net
	 * @param groupId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getMachines/", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object[]> getModels(HttpServletRequest request, ModelMap model) throws Exception {
		User user = (User)request.getSession().getAttribute(com.seaport.utils.SystemConstants.USER_MODEL);
		Collection<Machine> machineList = machineService.getMachines(user); 
		return Collections.singletonMap("aaData", getJSONForMachine(machineList));
	}	
     
    /**
    * I only want certain user info..
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
    			releaseYear = machine.getReleaseYear()==null?"":machine.getReleaseYear();
    			if (machine.getStartDate()!=null) {
    				startDate = DateFormatUtils.format(machine.getStartDate(), "yyyy/MM/dd");
				} else {
					startDate = "";
				}
    			contractNum = machine.getDoc()==null?"":machine.getDoc();
    			inventoryNumb = machine.getInventoryNumb() == null?"":machine.getInventoryNumb();
    			transNumb = machine.getTransNumb() == null?"":machine.getTransNumb();
    			factoryNumb = machine.getFactoryNumb() == null?"":machine.getFactoryNumb();
    			location = machine.getLocation() == null?"":machine.getLocation();
    			nomNum = machine.getNomNo() == null?"":machine.getNomNo();
    			regNum = machine.getRegNo() == null?"":machine.getRegNo();
    			machineNote = machine.getNote() == null?"":machine.getNote();

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
    			modelDetail = machine.getMachineModel().getDetails() == null?"":machine.getMachineModel().getDetails();
    			manufactorName = machine.getMachineModel().getManufacturer().getNameRus()==null?"":machine.getMachineModel().getManufacturer().getNameRus();
//    					+ "("+machine.getMachineModel().getManufacturer().getManufacturerId()+")";
    			manufCountry = machine.getMachineModel().getManufacturer().getCountry().getNameRus();
			} catch (Exception e) {
				
			}

    		try {
    			stevidorFullName = machine.getStevidor().getFullName();
    			portName = machine.getStevidor().getPort().getName();
    			portCountry = machine.getStevidor().getPort().getCountry().getNameRus();
			} catch (Exception e) {
			}
    		
            Object[] objectArray = new String[]{machine.getMachineId().toString(), groupId, machine.getModelId()==null?" ":machine.getModelId().toString(),
							            		groupName, modelName,
							            		stevidorFullName, portCountry, portName, modelDetail, manufactorName, releaseYear,
							            		startDate, contractNum, inventoryNumb, transNumb, factoryNumb,
							            		manufCountry, location, nomNum, regNum,
							            		machineNote};
            rdArray[i] = objectArray;
            i++;           
		}
        return rdArray;
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
