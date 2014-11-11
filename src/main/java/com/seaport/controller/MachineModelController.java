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

import com.seaport.command.MachineModelCommand;
import com.seaport.command.MachineModelEditCommand;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;
import com.seaport.service.ICountryService;
import com.seaport.service.IGroupService;
import com.seaport.service.IMachineModelService;
import com.seaport.service.IMachineService;
import com.seaport.service.IManufacturerService;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingConstant;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/26/13 <P>
 * 
 */
@Controller
@RequestMapping("/machineModel")
@SessionAttributes({"modelSearchCommand","machineModalEditCommand"})
public class MachineModelController {
	@Autowired
	private IMachineService machineService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IGroupService groupService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IManufacturerService manufacturerService;	
	@Autowired
	private IMachineModelService machineModelService;	
	
	
	/**
	 * Create new Machine Model search form. 
	 *  
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		
		MachineModelCommand machineModelCommand = new MachineModelCommand();
		//machineModelCommand.setMachineModelList(machineModelService.getModels());
		machineModelCommand.setGroupMap(groupService.getGroupMap());
		machineModelCommand.setManufacturerMap(manufacturerService.getManufacturerMap());
		machineModelCommand.setCountryMap(countryService.getContriesMap());
		
		model.put("modelSearchCommand", machineModelCommand);
		return "machineModel";
	}

	/**
     * Fetch a model list from the service and format it as JSON response to the client.
     * 
	 * @param groupId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getModels/{getArchive}", method = RequestMethod.GET)
	@ResponseBody
	public List<MachineModel> getMachineModels(@PathVariable boolean getArchive,
			HttpServletRequest request) throws Exception {
		List<MachineModel> machineList = machineModelService.getMachineModels(getArchive); 
		return machineList;
	}
	
	/**
	 * Set forms for edit Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{machineModelId}", method = RequestMethod.GET)
	public String editNewModel(ModelMap model, @PathVariable Integer machineModelId) throws Exception {
		
		MachineModelEditCommand machineModelEditCommand = new MachineModelEditCommand();
		machineModelEditCommand.setMachineModel(machineModelService.getModel(machineModelId));
		machineModelEditCommand.setGroupMap(groupService.getGroupMap());
		machineModelEditCommand.setManufacturerMap(manufacturerService.getManufacturerMap());
		machineModelEditCommand.setCountryMap(countryService.getContriesMap());	
		model.put("machineModalEditCommand", machineModelEditCommand);
		
		return "machineModelEdit";
	}

	
	/**
	 * Set forms for new Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/createNew/", method = RequestMethod.GET)
	public String createNewModel(ModelMap model) throws Exception {
		MachineModelEditCommand machineModelEditCommand = new MachineModelEditCommand();
		machineModelEditCommand.setGroupMap(groupService.getGroupMap());
		machineModelEditCommand.setManufacturerMap(manufacturerService.getManufacturerMap());
		machineModelEditCommand.setCountryMap(countryService.getContriesMap());	
		model.put("machineModalEditCommand", machineModelEditCommand);
		
		return "machineModelEdit";
	}	
	
	/**
	 * Get updated list of manufacturers.
	 * @param groupId
	 * @param countryId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getManufacturers/{groupId}/country/{countryId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Manufacturer> getManufacturers(@PathVariable("groupId") Integer groupId,  
									   @PathVariable("countryId") Integer countryId, 
									   ModelMap model) throws Exception {
		List<Manufacturer> manufacturerList = manufacturerService.getManufacturers(countryId, groupId);
		return manufacturerList;
	}
	
	/**
	 * Persisting changes.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save/{transType}", method = RequestMethod.POST)
	public String createEditNewModel(Model model, @PathVariable String transType,
									@Valid @ModelAttribute("machineModalEditCommand") MachineModelEditCommand machineModelEditCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "machineModelEdit";
		}
		
		if (transType.equalsIgnoreCase(VikingConstant.TRANS_TYPE_COPY)) {
			machineModelEditCommand.getMachineModel().setModelId(null);
		}
		
		machineModelService.saveMachineModel(machineModelEditCommand.getMachineModel());
		machineModelEditCommand.setSuccessFlag("true");
		model.addAttribute("message", "message.user.success.generic");
		return "machineModelEdit";
	}
	
	/**
	 * Deleteing machine model.
	 *  
	 * @param request
	 * @param model
	 * @param userSearchCommand
	 * @param result
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/delete/", method = RequestMethod.POST)
	public String deleteMachineModel(Model model,
									@ModelAttribute("modelSearchCommand") MachineModelCommand machineModelCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		List<MachineModel> machineModelList = machineModelCommand.getMachineModelList();
		boolean nothingToDelete = true;
		
		if (machineModelList == null || machineModelList.isEmpty()) {
			model.addAttribute("error", "message.user.error.generic");
			return "modelSearch";
		}

		for (MachineModel machineModel : machineModelList) {
			if (machineModel.getArchived()!=null && machineModel.getArchived().equalsIgnoreCase("Y")) {
				nothingToDelete = false;
//				machineService.	
			}
		}
		if (nothingToDelete) {
			model.addAttribute("error", "message.user.error.generic");
			return "modelSearch";			
		} else {
			redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		}
		return "redirect:/userSearchAdmin";
	}
	
}















