package com.seaport.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.User;
import com.seaport.service.IUserService;

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
	@Autowired
	private IUserService userService;
	
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Manufacturer> getManufacturers(Integer countryId, Integer groupId) {
		Criteria criteria = getCurrentSession().createCriteria(Manufacturer.class);
		criteria.add(Restrictions.eq("countryId", countryId));
		return criteria.list();
	}
	
	@Override
	public void saveManufacturer(Manufacturer manufacturer) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());

		/*for insert.*/
		if (manufacturer.getManufacturerId() == null) {
			manufacturer.setCreateUserId(user.getUserId());
			manufacturer.setCreateDate(updateDate);
		}
		manufacturer.setUpdateUserId(user.getUserId());
		manufacturer.setUpdateDate(updateDate);		
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
