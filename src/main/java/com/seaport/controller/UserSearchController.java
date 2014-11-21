package com.seaport.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.UserSearchCommand;
import com.seaport.domain.User;
import com.seaport.service.ICountryService;
import com.seaport.service.IPortService;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;


/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 * @version      2.0 12/21/13 <P>
 * 
 */
@Controller
@RequestMapping("/userSearchAdmin")
@SessionAttributes("userSearchCommand")
public class UserSearchController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IPortService portService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private IStevidorService stevidorService;
	@Autowired
	@Qualifier("sessionRegistry")
	private SessionRegistry sessionRegistry;
	
	/**
	 * Create new user search form. 
	 *  
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		
		UserSearchCommand userSearchCommand = new UserSearchCommand();
		List<User> userList = userService.getUsers();
		List<Object> principals = sessionRegistry.getAllPrincipals();
		
		/*Tune up output for user in MSC time zone*/
		SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("Europe/Moscow"));

		for (Object principal: principals) {
		    if (principal instanceof org.springframework.security.core.userdetails.User) {
		    	String userLogin = ((org.springframework.security.core.userdetails.User)principal).getUsername();
				for (User user : userList) {
					if (userLogin.equalsIgnoreCase(user.getLogin())) {
						user.setIsLoggedIn("Y");
					}
					String strUpdateDate = formatter.format(user.getUpdateDate());
					user.setLocalUpdateDate(strUpdateDate);
				}
		    }
		}
		
		userSearchCommand.setUserList(userList);		
		userSearchCommand.setUserPort(portService.getPortsMap());
		userSearchCommand.setUserStevidor(stevidorService.getStevidorsMap());
		userSearchCommand.setUserCountry(countryService.getContriesMap());
		
		model.put("userSearchCommand", userSearchCommand);
		return "admin/userSearchAdmin";
	}
	
	
	/**
	 * This mapped method used to delete users. It returns to the same page with success message.
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
									@ModelAttribute("userSearchCommand") UserSearchCommand userSearchCommand,
									BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		List<User> userList = userSearchCommand.getUserList();
		boolean nothingToDelete = true;
		
		if (userList == null || userList.isEmpty()) {
			model.addAttribute("error", "message.user.error.generic");
			return "admin/userSearchAdmin";
		}

		for (User user : userList) {
			if (user.getArchived()!=null && user.getArchived().equalsIgnoreCase("Y")) {
				nothingToDelete = false;
				userService.saveUser(user);	
			}
		}
		if (nothingToDelete) {
			model.addAttribute("error", "message.user.error.generic");
			return "admin/userSearchAdmin";			
		} else {
			redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		}
		return "redirect:/userSearchAdmin";
	}

	
	/**
	 * This has no any functionality attached at this moment.
	 * @param request
	 * @param model
	 * @param userSearchCommand
	 * @param result
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model,
								@Valid @ModelAttribute("userSearchCommand") UserSearchCommand userSearchCommand,
								BindingResult result, RedirectAttributes redirectAttributes) throws Exception {
		
		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "admin/userSearchAdmin";
		}
		return "redirect:userEditAdmin";
	}
	
}















