package com.seaport.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Country;
import com.seaport.domain.User;
import com.seaport.service.IUserService;

/**
 * The DAO class that serves any type of Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Repository
public class CountryDAOImpl implements ICountryDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private IUserService userService;
	
	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Country getCountry(Integer countryId) {
		return (Country)openSession().get(Country.class, countryId);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Country> getContries(){
		return sessionFactory.getCurrentSession().createCriteria(Country.class).list();
	}
	
	@Override
	public void saveCountry(Country country) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		
		/*for insert.*/
		if (country.getCountryId() == null) {
			country.setCreateUserId(user.getUserId());
			country.setCreateDate(updateDate);
		}
		country.setUpdateUserId(user.getUserId());
		country.setUpdateDate(updateDate);
		getCurrentSession().saveOrUpdate(country);
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
