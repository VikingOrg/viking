package com.seaport.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Manufacturer;

/**
 * The DAO class that serves any type of Manufacturer requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Repository
public class ManufacturerDAOImpl implements IManufacturerDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Manufacturer getManufacturer(int manufacturerId) {
		Manufacturer manufacturer = (Manufacturer) getCurrentSession().get(Manufacturer.class, manufacturerId);
		return manufacturer;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Manufacturer> getManufacturers() {
		return getCurrentSession().createCriteria(Manufacturer.class).list();
	}

	@Override
	public void saveManufacturer(Manufacturer manufacturer) {
		getCurrentSession().saveOrUpdate(manufacturer);
	}

	@Override
	public Map<Integer, Manufacturer> getManufacturerMap() {
		Map<Integer, Manufacturer> manufacturersMap = new LinkedHashMap<Integer, Manufacturer>();
		List<Manufacturer> manufacturerList = this.getManufacturers();
		for (Manufacturer manufacturer : manufacturerList) {
			manufacturersMap.put(manufacturer.getManufacturerId(), manufacturer);
		}
		return manufacturersMap;
	}
	
}
