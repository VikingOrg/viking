package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.MachineEditCommand;
import com.seaport.service.IUserService;

@Service
public class MachineValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return MachineEditCommand.class.isAssignableFrom(clazz);

	}
	public MachineValidator(){
		super();
	}
	
	public MachineValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
	}
}