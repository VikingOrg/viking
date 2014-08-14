package com.seaport.controller;

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

import com.seaport.command.GroupCommand;
import com.seaport.service.IGroupService;
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
@RequestMapping("/group")
@SessionAttributes("groupCommand")
public class GroupController {

	@Autowired
	private IUserService userService;
	@Autowired
	private IGroupService groupService;
	
	/**
	 * Create new Group search form. 
	 *  
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		
		GroupCommand groupCommand = new GroupCommand();
		groupCommand.setGroupList(groupService.getGroups());
		
		model.put("groupCommand", groupCommand);
		return "groupSearch";
	}

	/**
	 * Set forms for edit Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{groupId}", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model, @PathVariable Integer groupId) throws Exception {
		GroupCommand groupCommand = new GroupCommand();
		groupCommand.setCurrentGroup(groupService.getGroup(groupId));
		model.put("groupCommand", groupCommand);
		return "groupEdit";	
	}
	
	/**
	 * Set forms for new Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/createNew/", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model) throws Exception {
		model.put("groupCommand", new GroupCommand());
		return "groupEdit";
	}	
	
	/**
	 * Set forms for a new Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save/{transType}", method = RequestMethod.POST)
	public String createEditNewModel(Model model,  @PathVariable String transType, 
									@Valid @ModelAttribute("groupCommand") GroupCommand groupCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "groupEdit";
		}
		if (transType.equalsIgnoreCase(SystemConstants.TRANS_TYPE_COPY)) {
			groupCommand.getCurrentGroup().setGroupId(null);
		}
		groupService.saveGroup(groupCommand.getCurrentGroup());
		groupCommand.setSuccessFlag("true");
		model.addAttribute("message", "message.user.success.generic");
		return "groupEdit";
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
//	@RequestMapping(value="/delete/", method = RequestMethod.POST)
//	public String deleteUsers(Model model,
//									@ModelAttribute("modelSearchCommand") GroupCommand groupCommand,
//									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
//		List<MachineModel> machineModelList = groupCommand.getMachineModelList();
//		boolean nothingToDelete = true;
//		
//		if (machineModelList == null || machineModelList.isEmpty()) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "modelSearch";
//		}
//
//		for (MachineModel machineModel : machineModelList) {
//			if (machineModel.getArchived()!=null && machineModel.getArchived().equalsIgnoreCase("Y")) {
//				nothingToDelete = false;
//			}
//		}
//		if (nothingToDelete) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "modelSearch";			
//		} else {
//			redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
//		}
//		return "redirect:/userSearchAdmin";
//	}
	
}















