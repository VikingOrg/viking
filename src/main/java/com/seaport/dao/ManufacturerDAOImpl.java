package com.seaport.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Manufacturer;
import com.seaport.domain.User;
import com.seaport.service.IUserService;
import com.seaport.utils.CustomDateSerializer;

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
		Criteria criteria = getCurrentSession().createCriteria(Manufacturer.class);
		criteria.addOrder(Order.asc("nameRus"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Manufacturer> getManufacturers(Integer groupId) {
		if (groupId != null && groupId.intValue() == 0) {
			return this.getManufacturers();
		}
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("select b.manufacturer_id AS manufacturerId, b.country_id AS countryId, b.address, b.archived, b.email, ");
		strBuilder.append("b.name_rus AS nameRus, b.name_en AS nameEn, b.note, b.phone, b.create_date AS createDate, ");
		strBuilder.append("b.create_user_id AS createUserId, b.update_date AS updateDate, b.update_user_id AS updateUserId ");
		strBuilder.append("from models a ");
		strBuilder.append("join manufacturers b on a.manufacturer_id=b.manufacturer_id ");
		strBuilder.append("join groups c on a.group_id=c.group_id ");
		strBuilder.append("where c.group_id = :groupId group by b.manufacturer_id ");
		
		Query query = getCurrentSession()
				.createSQLQuery(strBuilder.toString())
				.setResultTransformer(Transformers.aliasToBean(Manufacturer.class))
				.setParameter("groupId", groupId);
		List<Manufacturer> result = query.list();
		return result;
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
