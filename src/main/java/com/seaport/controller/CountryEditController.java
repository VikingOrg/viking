package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.seaport.command.CountryEditCommand;
import com.seaport.service.ICountryService;
import com.seaport.service.IUserService;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/17/14 <P>
 */

@Controller
@RequestMapping("/countryEdit")
@SessionAttributes("countryEditCommand")
public class CountryEditController {
	@Autowired
	private IUserService userService;
	@Autowired
	private ICountryService countryService;
	
	/**
	 * Setup for Country Editing form.
	 * @param request
	 * @param countryId
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit/{countryId}", method = RequestMethod.GET)
	public String editUser(HttpServletRequest request,
							@PathVariable String countryId, 
							ModelMap model)  throws Exception{
		CountryEditCommand CountryEditCommand = new CountryEditCommand();
		if (countryId != null) {
			CountryEditCommand.setCountry(countryService.getCountry(Integer.parseInt(countryId)));
		}
		model.put("countryEditCommand", CountryEditCommand);
		return "countryEdit";
	}

	/**
	 * Setup for a new Country form
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/new/", method = RequestMethod.GET)
	public String newUser(ModelMap model) throws Exception {
		CountryEditCommand CountryEditCommand = new CountryEditCommand();
		model.put("countryEditCommand", CountryEditCommand);
		return "countryEdit";
	}
	
//	
//	@RequestMapping(method = RequestMethod.POST) 
//	public String onSubmit(HttpServletRequest request, Model model, 
//								@Valid @ModelAttribute("countryEditCommand") CountryEditCommand countryEditCommand,
//								BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
//
//		if (result.hasErrors()) {
//			model.addAttribute("error", "message.user.error.generic");
//			return "countryEdit";
//		}
//		
//		/*Setting up default not null values.*/
//		Timestamp updateDate = new Timestamp(new Date().getTime());
//		User user = (User)request.getSession().getAttribute(SystemConstants.USER_MODEL);
//		if (countryEditCommand.getStevidor().getStevidorId()== null) {
//			countryEditCommand.getStevidor().setCreateUserId(user.getUserId());
//			countryEditCommand.getStevidor().setCreateDate(updateDate);
//		}
//		countryEditCommand.getStevidor().setUpdateUserId(user.getUserId());
//		countryEditCommand.getStevidor().setUpdateDate(updateDate);
//		
//		portService.saveStevidor(countryEditCommand.getStevidor());
//		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
//		
//		return "redirect:stevidorSearch";
//	}
}
