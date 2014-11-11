package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IManufacturerDAO;
import com.seaport.domain.Manufacturer;

/**
 * The Service layer interface for Manufacturer requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Service
@Transactional
public class ManufacturerServiceImpl implements IManufacturerService {
	@Autowired
	private IManufacturerDAO manufacturerDAO;
	
	public Manufacturer getManufacturer(int manufacturerId){
		return manufacturerDAO.getManufacturer(manufacturerId);
	}
	public List<Manufacturer> getManufacturers() {
		return manufacturerDAO.getManufacturers();
	}
	public void saveManufacturer(Manufacturer manufacturer){
		manufacturerDAO.saveManufacturer(manufacturer);
	}
	
	public Map<Integer, Manufacturer> getManufacturerMap(){
		return manufacturerDAO.getManufacturerMap();
	}
	public List<Manufacturer> getManufacturers(Integer countryId, Integer groupId) {
		return manufacturerDAO.getManufacturers(countryId, groupId);
	}
}
