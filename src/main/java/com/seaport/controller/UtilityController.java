package com.seaport.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.seaport.command.UtilityCommand;
import com.seaport.service.IGroupService;
import com.seaport.service.IUserService;


/**
 * The Controller class that invoke business logic and create a Utility objects. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 08/19/14 <P>
 * 
 */
@Controller
@RequestMapping("/utility")
@SessionAttributes("utilityCommand")
public class UtilityController {

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
		
		UtilityCommand utilityCommand = new UtilityCommand();
		utilityCommand.setGroupList(groupService.getGroups());
		
		model.put("utilityCommand", utilityCommand);
		return "utility";
	}
}
