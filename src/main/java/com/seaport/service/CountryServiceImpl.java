package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.ICountryDAO;
import com.seaport.domain.Country;

/**
 * The Service layer interface for Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Service
@Transactional
public class CountryServiceImpl implements ICountryService {
	@Autowired
	private ICountryDAO countryDAO;

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
		countryDAO.saveCountry(country);
	}

	@Override
	public Map<Integer, Country> getContriesMap() {
		return countryDAO.getContriesMap();
	}
}
