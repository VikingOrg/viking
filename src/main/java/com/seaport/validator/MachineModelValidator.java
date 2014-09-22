package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.MachineModelCommand;
import com.seaport.service.IUserService;

@Service
public class MachineModelValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return MachineModelCommand.class.isAssignableFrom(clazz);

	}
	public MachineModelValidator(){
		super();
	}
	
	public MachineModelValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
	}
	
}