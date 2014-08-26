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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.MachineModelCommand;
import com.seaport.command.MachineModelEditCommand;
import com.seaport.domain.MachineModel;
import com.seaport.service.IGroupService;
import com.seaport.service.IMachineService;
import com.seaport.service.IUserService;
import com.seaport.utils.SystemConstants;

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
		machineModelCommand.setMachineModelList(machineService.getModels());
		machineModelCommand.setGroupMap(groupService.getGroupMap());
		machineModelCommand.setManufacturerMap(machineService.getManufacturerMap());
		machineModelCommand.setCountryMap(userService.getContriesMap());
		
		model.put("modelSearchCommand", machineModelCommand);
		return "machineModel";
	}

	/**
	 * Set forms for edit Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{machineModelId}", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model, @PathVariable Integer machineModelId) throws Exception {
		
		MachineModelEditCommand machineModelEditCommand = new MachineModelEditCommand();
		machineModelEditCommand.setMachineModel(machineService.getModel(machineModelId));
		machineModelEditCommand.setGroupMap(groupService.getGroupMap());
		machineModelEditCommand.setManufacturerMap(machineService.getManufacturerMap());
		machineModelEditCommand.setCountryMap(userService.getContriesMap());	
		model.put("machineModalEditCommand", machineModelEditCommand);
		
		return "machineModelEdit";
	}

	
	/**
	 * Set forms for new Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/createNew/", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model) throws Exception {
		MachineModelEditCommand machineModelEditCommand = new MachineModelEditCommand();
		machineModelEditCommand.setGroupMap(groupService.getGroupMap());
		machineModelEditCommand.setManufacturerMap(machineService.getManufacturerMap());
		machineModelEditCommand.setCountryMap(userService.getContriesMap());	
		model.put("machineModalEditCommand", machineModelEditCommand);
		
		return "machineModelEdit";
	}	
	
	/**
	 * Set forms for a new Machine Model.
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
		
		if (transType.equalsIgnoreCase(SystemConstants.TRANS_TYPE_COPY)) {
			machineModelEditCommand.getMachineModel().setModelId(null);
		}
		
		machineService.saveMachineModel(machineModelEditCommand.getMachineModel());
		machineModelEditCommand.setSuccessFlag("true");
		model.addAttribute("message", "message.user.success.generic");
		return "machineModelEdit";
	}
	
	/**
	 * This mapped method used to delete models. It returns to the same page with success message.
	 *  
	 * @param request
	 * @param model
	 * @param userSearchCommand
	 * @param result
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value="/delete/", method = RequestMethod.POST)
	public String deleteUsers(Model model,
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















