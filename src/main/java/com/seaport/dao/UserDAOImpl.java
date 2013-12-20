package com.seaport.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Country;
import com.seaport.domain.Role;
import com.seaport.domain.User;

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
	@Autowired
	private IRoleDAO roleDAO;
	
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
	public List<User> getUsers(){
		return sessionFactory.getCurrentSession().createCriteria(User.class).list();
	}
	
	@Override
	public void saveUser(User user){
		/*Setting up default not null values*/
		Timestamp updateDate = new Timestamp(new Date().getTime());
		user.setUpdateDate(updateDate);
		user.setLogin(user.getUserEmail());
		if (user.getUserId() == null) {
			user.setCreateDate(updateDate);
		}
		if (user.getRole() == null) {
			Role role = (Role) roleDAO.getRole(1);
			user.setRole(role);
		}
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
}
