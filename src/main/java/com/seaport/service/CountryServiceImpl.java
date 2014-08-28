package com.seaport.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.seaport.dao.ICountryDAO;
import com.seaport.domain.Country;
import com.seaport.domain.User;

/**
 * The Service layer interface for Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Service
public class CountryServiceImpl implements ICountryService {
	@Autowired
	private ICountryDAO countryDAO;
	@Autowired
	private IUserService userService;
	
	@Override
	public Country getCountry(Integer countryId) {
		return countryDAO.getCountry(countryId);
	}

	@Override
	public List<Country> getContries() {
		return countryDAO.getContries();
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
		countryDAO.saveCountry(country);
	}

	@Override
	public Map<Integer, Country> getContriesMap() {
		return countryDAO.getContriesMap();
	}
}
