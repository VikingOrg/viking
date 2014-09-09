package com.seaport.validator;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.RegistrationCommand;
import com.seaport.service.IUserService;
import com.seaport.utils.VikingUtils;

@Service
public class UserEditValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return RegistrationCommand.class.isAssignableFrom(clazz);

	}
	public UserEditValidator(){
		super();
	}
	
	public UserEditValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
		RegistrationCommand registrationCommand = (RegistrationCommand)target;
		
		/*Check if empty*/
		if (VikingUtils.isEmpty(registrationCommand.getOldPassword())) {
			if (!VikingUtils.isEmpty(registrationCommand.getNewPassword()) || !VikingUtils.isEmpty(registrationCommand.getNewPasswordCheck())) {
				errors.rejectValue("oldPassword", "validation.size.login");
			}
		} else {
			if (VikingUtils.isEmpty(registrationCommand.getNewPassword())) {
				errors.rejectValue("newPassword", "validation.size.login");
			}
			if (VikingUtils.isEmpty(registrationCommand.getNewPasswordCheck())) {
				errors.rejectValue("newPasswordCheck", "validation.size.login");
			}
			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			if (!bCryptPasswordEncoder.matches(registrationCommand.getOldPassword(), registrationCommand.getUser().getPassword())) {
				errors.rejectValue("oldPassword", "user.notmatch.password");
			}
		}
		
		if(!(registrationCommand.getNewPassword().equals(registrationCommand.getNewPasswordCheck()))){
			errors.rejectValue("newPassword", "user.notmatch.password");
		}
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
}