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

import com.seaport.command.PortCommand;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.utils.VikingConstant;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/09/14 <P>
 */

@Controller
@RequestMapping("/port")
@SessionAttributes("portCommand")
public class PortController {
	@Autowired
	private ICountryService countryService;
	
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		PortCommand portCommand = new PortCommand();
		portCommand.setCountryMap(countryService.getContriesMap());
		portCommand.setPortList(portService.getPorts());
		model.put("portCommand", portCommand);
		return "portSearch";
	}
	
	
	/**
	 * Set forms to edit Port.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{portId}", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model, @PathVariable Integer portId) throws Exception {
		PortCommand portCommand = new PortCommand();
		portCommand.setPort(portService.getPort(portId));
		portCommand.setCountryMap(countryService.getContriesMap());
		model.put("portCommand", portCommand);
		return "portEdit";	
	}
	
	
	/**
	 * Set forms for new Port.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/createNew/", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model) throws Exception {
		PortCommand portCommand = new PortCommand();
		portCommand.setCountryMap(countryService.getContriesMap());
		model.put("portCommand", portCommand);
		return "portEdit";
	}	
	
	
	/**
	 * Persisting Port data.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save/{transType}", method = RequestMethod.POST)
	public String createEditNewModel(Model model,  @PathVariable String transType, 
									@Valid @ModelAttribute("portCommand") PortCommand portCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "portEdit";
		}
		if (transType.equalsIgnoreCase(VikingConstant.TRANS_TYPE_COPY)) {
			portCommand.getPort().setPortId(null);
		}
		portService.savePort(portCommand.getPort());
		portCommand.setSuccessFlag("true");
		model.addAttribute("message", "message.user.success.generic");
		return "portEdit";
	}
}
