package com.seaport.dao;

import com.seaport.domain.User;

public interface UserDAO {
	
	public User getUser(String login);
	public void saveUser(User user);
}
