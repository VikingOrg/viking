package com.seaport.service;

import java.util.List;
import com.seaport.domain.User;

public interface IUserService {
	
	public User getUser(String login);
	public void saveUser(User user);
	public List<User> getUser(Object[] params);
	public User getUser(Integer userId);
}