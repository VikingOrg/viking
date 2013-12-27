package com.seaport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.ModelSearchCommand;
import com.seaport.domain.MachineModel;
import com.seaport.service.IMachineService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/26/13 <P>
 * 
 */
@Controller
@RequestMapping("/modelSearch")
@SessionAttributes("modelSearchCommand")
public class ModelSearchController {
	@Autowired
	private IMachineService machineService;
	@Autowired
	private IUserService userService;
	
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
		
		ModelSearchCommand modelSearchCommand = new ModelSearchCommand();
		modelSearchCommand.setMachineModelList(machineService.getModels());
		modelSearchCommand.setGroupMap(machineService.getGroupsMap());
		modelSearchCommand.setManufacturerMap(machineService.getManufacturerMap());
		modelSearchCommand.setCountryMap(userService.getContriesMap());
		
		model.put("modelSearchCommand", modelSearchCommand);
		return "modelSearch";
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
									@ModelAttribute("modelSearchCommand") ModelSearchCommand modelSearchCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		List<MachineModel> machineModelList = modelSearchCommand.getMachineModelList();
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















