package com.seaport.dao;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Country;
import com.seaport.domain.User;
import com.seaport.domain.UserDTO;

/**
 * The DAO class that serves any type of User requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Repository
public class UserDAOImpl implements IUserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private IPortDAO portDAO;
	
	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User getUser(String login) {
		List<User> userList = new ArrayList<User>();
		Query query = openSession().createQuery("from User u where u.login = :login");
		query.setParameter("login", login);
		userList = query.list();
		if (userList.size() > 0)
			return userList.get(0);
		else
			return null;	
	}
	
	@Override
	public User getUser(Integer userId) {
		return (User)openSession().get(User.class, userId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUser(Object[] params){
		return sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}
	@Override
	public void saveUser(User user){
		openSession().saveOrUpdate(user);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Country> getContries(){
		return sessionFactory.getCurrentSession().createCriteria(Country.class).list();
	}
	@Override
	public Map<Integer, Country> getContriesMap(){
		Map<Integer, Country> countriesMap = new LinkedHashMap<Integer,Country>();
		List<Country> countryList = getContries();
		for (Country countries : countryList) {
			countriesMap.put(countries.getCountryId(), countries);
		}
		return countriesMap;
	}
	
	@Override
	public List<UserDTO> getUserDTOs(Object[] params){
		List<UserDTO> userDtoList = new ArrayList<UserDTO>();
		List<User> users = getUser(params);
		for (User user : users) {
			UserDTO userDTO = new UserDTO();
			userDTO.setUser(user);
			userDTO.setCountries(this.getContriesMap().get(user.getCountryId()));
			userDTO.setPort(portDAO.getPortsMap().get(user.getPortId()));
			userDTO.setStevedor(portDAO.getStevedorsMap().get(user.getStevedorId()));
			userDtoList.add(userDTO);
		}
		return userDtoList;
	}
}
