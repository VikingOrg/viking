package com.seaport.validator;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.seaport.command.GroupCommand;
import com.seaport.service.IUserService;

@Service
public class GroupValidator implements Validator{
	private IUserService userService;
	
	@Override
	public boolean supports(@SuppressWarnings("rawtypes") Class clazz) {
		return GroupCommand.class.isAssignableFrom(clazz);

	}
	public GroupValidator(){
		super();
	}
	
	public GroupValidator(IUserService userService) {
		this.userService = userService;
	}	
	
	@Override
	public void validate(Object target, Errors errors) {
		
	}
	
}