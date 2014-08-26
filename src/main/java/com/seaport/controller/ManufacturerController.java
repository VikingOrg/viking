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

import com.seaport.command.ManufacturerCommand;
import com.seaport.service.IManufacturerService;
import com.seaport.service.IUserService;
import com.seaport.utils.SystemConstants;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 08/12/14 <P>
 * 
 */
@Controller
@RequestMapping("/manufacturer")
@SessionAttributes("manufacturerCommand")
public class ManufacturerController {
	@Autowired
	private IManufacturerService manufacturerService;
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
		
		ManufacturerCommand manufacturerCommand = new ManufacturerCommand();
		manufacturerCommand.setManufacturerList(manufacturerService.getManufacturers());
		manufacturerCommand.setCountryMap(userService.getContriesMap());
		model.put("manufacturerCommand", manufacturerCommand);
		return "manufacturerSearch";
	}

	/**
	 * Set forms for edit Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{manufacturerlId}", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model, @PathVariable Integer manufacturerlId) throws Exception {
		ManufacturerCommand manufacturerCommand = new ManufacturerCommand();
		manufacturerCommand.setCurrentManufacturer(manufacturerService.getManufacturer(manufacturerlId));
		manufacturerCommand.setCountryMap(userService.getContriesMap());
		model.put("manufacturerCommand", manufacturerCommand);
		return "manufacturerEdit";
	}

	
	/**
	 * Set forms for new Machine Model.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/createNew/", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model) throws Exception {
		ManufacturerCommand manufacturerCommand = new ManufacturerCommand();
		manufacturerCommand.setCountryMap(userService.getContriesMap());
		model.put("manufacturerCommand", manufacturerCommand);
		return "manufacturerEdit";
	}	
	
	
	/**
	 * Saving data from Manufacturer Edit page.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save/{transType}", method = RequestMethod.POST)
	public String createEditNewModel(Model model,  @PathVariable String transType, 
									@Valid @ModelAttribute("manufacturerCommand") ManufacturerCommand manufacturerCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "manufacturerEdit";
		}
		
		if (transType.equalsIgnoreCase(SystemConstants.TRANS_TYPE_COPY)) {
			manufacturerCommand.getCurrentManufacturer().setManufacturerId(null);
		}
		manufacturerService.saveManufacturer(manufacturerCommand.getCurrentManufacturer());
		manufacturerCommand.setSuccessFlag("true");
		model.addAttribute("message", "message.user.success.generic");
		return "manufacturerEdit";
	}	
	
}















