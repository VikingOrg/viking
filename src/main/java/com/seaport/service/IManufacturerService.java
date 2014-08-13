package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Manufacturer;

/**
 * The Service layer interface for Manufacturer requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
public interface IManufacturerService {
	public Manufacturer getManufacturer(int manufacturerId);
	public List<Manufacturer> getManufacturers();
	public void saveManufacturer(Manufacturer manufacturer);
	public Map<Integer, Manufacturer> getManufacturerMap();
}
