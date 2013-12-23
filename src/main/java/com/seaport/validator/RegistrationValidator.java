package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.RegistrationCommand;
import com.seaport.domain.User;
import com.seaport.service.IUserService;

@Service
public class RegistrationValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return RegistrationCommand.class.isAssignableFrom(clazz);

	}
	public RegistrationValidator(){
		super();
	}
	
	public RegistrationValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "myFieldMapping", "message.from.file","Here goes message too.");
		
		RegistrationCommand registrationCommand = (RegistrationCommand)target;
		
		if(!(registrationCommand.getUser().getPassword().equals(registrationCommand.getPswordCheck()))){
			errors.rejectValue("user.password", "user.notmatch.password");
		}
		User user = userService.getUser(registrationCommand.getUser().getUserEmail());
		if (user != null) {
			errors.rejectValue("user.userEmail", "user.exist.login");
		}

//		
//		if(cust.getFavFramework().length==0){
//			errors.rejectValue("favFramework", "required.favFrameworks");
//		}
//
//		if("NONE".equals(cust.getCountry())){
//			errors.rejectValue("country", "required.country");
//		}
		
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
}