package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.CountryCommand;
import com.seaport.service.IUserService;

@Service
public class CountryValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return CountryCommand.class.isAssignableFrom(clazz);

	}
	public CountryValidator(){
		super();
	}
	
	public CountryValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
		
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
}