package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;

/**
 * The DAO interface for Country requests
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/26/14
 *          
 */
public interface ICountryDAO {
	public Country getCountry(Integer countryId);
	public List<Country> getContries();
	public void saveCountry(Country country);
	public Map<Integer, Country> getContriesMap();
}
