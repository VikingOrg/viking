package com.seaport.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seaport.command.RegistrationCommand;
import com.seaport.domain.Role;
import com.seaport.service.RoleService;
import com.seaport.service.UserService;

@Controller
@RequestMapping("/register")
public class RegistrationController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) {
		RegistrationCommand registrationCommand = new RegistrationCommand();
    	registrationCommand.getUserPort().put(0, "Не указывать");
    	registrationCommand.getUserPort().put(1, "Большой Порт Сакт-Петербурга");
    	registrationCommand.getUserPort().put(2, "Малый Порт Санкт-Оренбурга");

    	registrationCommand.getUserStevedor().put(0, "Не указывать");
    	registrationCommand.getUserStevedor().put(1, "Стеведор-Помидор");
    	registrationCommand.getUserStevedor().put(2, "Хрен Редьки Не Слаще");
	    
    	registrationCommand.getUserOccupation().put(0, "Не указывать");
    	registrationCommand.getUserOccupation().put(1, "Главный");
    	registrationCommand.getUserOccupation().put(2, "Самый Главный");
    	registrationCommand.getUserOccupation().put(2, "Ниглавнейший");
		
		model.put("registrationCommand", registrationCommand);
		return "access/register";
	}
	
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, 
								@ModelAttribute RegistrationCommand registrationCommand,
								BindingResult result) {
		
		/*Setting up default not null values*/
		Timestamp updateDate = new Timestamp(new Date().getTime());
		registrationCommand.getUser().setCreateDate(updateDate);
		registrationCommand.getUser().setUpdateDate(updateDate);
		registrationCommand.getUser().setLogin(registrationCommand.getUser().getUserEmail());
		Role role = (Role) roleService.getRole(1);
		registrationCommand.getUser().setRole(role);
		userService.saveUser(registrationCommand.getUser());
		String message = "002340";
		return "redirect:/login?message="+message;
	}
}
