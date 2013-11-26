package com.seaport.dao;

import java.util.List;
import com.seaport.domain.User;

public interface IUserDAO {
	
	public User getUser(String login);
	public void saveUser(User user);
	public List<User> getUser(Object[] params);
}
