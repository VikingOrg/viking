package com.seaport.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Group;

/**
 * The DAO class that serves any type of Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Repository
public class GroupDAOImpl implements IGroupDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Group getGroup(int groupId) {
		Group group = (Group) getCurrentSession().get(Group.class, groupId);
		return group;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Group> getGroups(){
		return getCurrentSession().createCriteria(Group.class).list();
	}
	
	@Override
	public void saveGroup(Group group) {
		getCurrentSession().saveOrUpdate(group);
	}
	
	@Override
	public Map<Integer, Group> getGroupMap(){
		Map<Integer, Group> groupMap = new LinkedHashMap<Integer, Group>();
		List<Group> groupList = this.getGroups();
		for (Group group : groupList) {
			groupMap.put(group.getGroupId(), group);
		}
		return groupMap;		
	}
		
}
