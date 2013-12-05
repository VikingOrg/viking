package com.seaport.command;

import java.util.ArrayList;
import java.util.List;

import com.seaport.domain.UserDTO;

public class UserSearchCommand {
	
	private List<UserDTO> userDtoList = new ArrayList<UserDTO>();

	public List<UserDTO> getUserDtoList() {
		return userDtoList;
	}

	public void setUserDtoList(List<UserDTO> userDtoList) {
		this.userDtoList = userDtoList;
	}
	
}
