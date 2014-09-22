package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.ManufacturerCommand;
import com.seaport.service.IUserService;

@Service
public class ManufacturerValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return ManufacturerCommand.class.isAssignableFrom(clazz);

	}
	public ManufacturerValidator(){
		super();
	}
	
	public ManufacturerValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
}