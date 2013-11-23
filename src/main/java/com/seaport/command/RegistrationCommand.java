package com.seaport.command;

import com.seaport.domain.User;

public class RegistrationCommand {
	private User user = new User();

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
