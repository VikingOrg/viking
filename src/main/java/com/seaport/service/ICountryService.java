package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;

/**
 * The Service layer interface for Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 05/26/14
 *          
 */
public interface ICountryService {
	public Country getCountry(Integer countryId);
	public List<Country> getContries();
	public void saveCountry(Country country);
	public Map<Integer, Country> getContriesMap();
}
