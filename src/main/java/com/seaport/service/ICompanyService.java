package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Manufacturer;

/**
 * The Service layer interface for User requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
public interface ICompanyService {
	public Manufacturer getManufacturer(int manufacturerId);
	public List<Manufacturer> getManufacturers();
	public void saveManufacturer(Manufacturer manufacturer);
	public Map<Integer, Manufacturer> getManufacturerMap();
}
