package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.User;
/**
 * The interface for User requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
public interface IUserDAO {
	
	public User getUser(String login);
	public void saveUser(User user);
	public List<User> getUsers();
	public User getUser(Integer userId);
	public List<Country> getContries();
	public Map<Integer, Country> getContriesMap();
	public boolean hasRole(String role);
	public Country getCountry(Integer countryId);
}
