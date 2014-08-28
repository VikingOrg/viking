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

import com.seaport.command.CountryCommand;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.utils.SystemConstants;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/country")
@SessionAttributes("countryCommand")
public class CountryController {
	@Autowired
	private ICountryService countryService;
	
	@Autowired
	private IPortService portService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		CountryCommand countryCommand = new CountryCommand();
		countryCommand.setCountryList(countryService.getContries());
		model.put("countryCommand", countryCommand);
		return "countrySearch";
	}
	
	
	/**
	 * Set forms to edit Country.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/edit/{countryId}", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model, @PathVariable Integer countryId) throws Exception {
		CountryCommand countryCommand = new CountryCommand();
		countryCommand.setCountry(countryService.getCountry(countryId));
		model.put("countryCommand", countryCommand);
		return "countryEdit";	
	}
	
	
	/**
	 * Set forms for new Country.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/createNew/", method = RequestMethod.GET)
	public String createEditNewModel(ModelMap model) throws Exception {
		model.put("countryCommand", new CountryCommand());
		return "countryEdit";
	}	
	
	/**
	 * Persisting Port data.
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save/{transType}", method = RequestMethod.POST)
	public String createEditNewModel(Model model,  @PathVariable String transType, 
									@Valid @ModelAttribute("countryCommand") CountryCommand countryCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "countryEdit";
		}
		if (transType.equalsIgnoreCase(SystemConstants.TRANS_TYPE_COPY)) {
			countryCommand.getCountry().setCountryId(null);
		}
		
		countryService.saveCountry(countryCommand.getCountry());
		countryCommand.setSuccessFlag("true");
		model.addAttribute("message", "message.user.success.generic");
		return "countryEdit";
	}
}
