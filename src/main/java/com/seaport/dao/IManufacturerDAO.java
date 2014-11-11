package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Manufacturer;

/**
 * The DAO interface for Manufacturer requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
public interface IManufacturerDAO {
	public Manufacturer getManufacturer(int ManufacturerId);
	public List<Manufacturer> getManufacturers();
	public void saveManufacturer(Manufacturer manufacturer);
	public Map<Integer, Manufacturer> getManufacturerMap();
	public List<Manufacturer> getManufacturers(Integer countryId, Integer groupId);
}
