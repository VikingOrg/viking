package com.seaport.dao;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.domain.Contact;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;
import com.seaport.utils.VikingUtil;

/**
 * The DAO class that serves any type of Stevidor requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/27/14
 *          
 */
@Repository
@Transactional
public class StevidorDAOImpl implements IStevidorDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Stevidor getStevidor(int stevidorId) {
		Stevidor stevidor = (Stevidor)getCurrentSession().get(Stevidor.class, stevidorId);
		return stevidor;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Stevidor> getStevidors() {
		Criteria criteria = getCurrentSession().createCriteria(Stevidor.class);
		criteria.addOrder(Order.asc("name"));
		List<Stevidor> stevidorList = criteria.list(); 
		return stevidorList;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Stevidor> getStevidors(Integer portId) {
		Criteria criteria = getCurrentSession().createCriteria(Stevidor.class);
		criteria.add(Restrictions.eq("portId", portId));
		criteria.addOrder(Order.asc("name"));
		List<Stevidor> stevidorList = criteria.list(); 
		return stevidorList;
	}
	
	@Override
	public void saveStevidor(Stevidor stevidor) {
		/*Check for empty contacts and remove them from being saved.*/
		for (Iterator<Contact> iter = stevidor.getContacts().listIterator(); iter.hasNext(); ) {
			Contact contact = iter.next();
		    if (VikingUtil.isEmpty(contact.getFns())) {
		        iter.remove();
		    }
		}
		getCurrentSession().saveOrUpdate(stevidor);
	}

	@Override
	public Map<Integer, Stevidor> getStevidorsMap() {
		Map<Integer, Stevidor> stevidorMap = new LinkedHashMap<Integer, Stevidor>();
		List<Stevidor> stevidorList = this.getStevidors();
		for (Stevidor stevidor : stevidorList) {
			stevidorMap.put(stevidor.getStevidorId(), stevidor);
		}
		return stevidorMap;
	}
	
}
