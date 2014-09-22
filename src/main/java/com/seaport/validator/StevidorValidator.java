package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.StevidorEditCommand;
import com.seaport.domain.User;
import com.seaport.service.IStevidorService;
import com.seaport.service.IUserService;

@Service
public class StevidorValidator implements Validator{
	private IUserService userService;
	private IStevidorService stevidorService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return StevidorEditCommand.class.isAssignableFrom(clazz);

	}
	public StevidorValidator(){
		super();
	}
	
	public StevidorValidator(IUserService userService, IStevidorService stevidorService) {
		super();
		this.userService = userService;
		this.stevidorService = stevidorService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
		StevidorEditCommand stevidorEditCommand = (StevidorEditCommand)target;
		
//		stevidorService.getStevidor(stevidorId);
//		
//		if(!(registrationCommand.getUser().getPassword().equals(registrationCommand.getPswordCheck()))){
//			errors.rejectValue("user.password", "user.notmatch.password");
//		}
//		User user = userService.getUser(registrationCommand.getUser().getUserEmail());
//		if (user != null) {
//			errors.rejectValue("user.userEmail", "user.exist.login");
//		}
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
}