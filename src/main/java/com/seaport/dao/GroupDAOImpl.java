package com.seaport.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.seaport.domain.Group;
import com.seaport.domain.User;
import com.seaport.service.IUserService;

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
	@Autowired
	private IUserService userService;
	
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
		Criteria criteria = getCurrentSession().createCriteria(Group.class);
		criteria.addOrder(Order.asc("groupOrder"));
		return criteria.list();
	}
	
	@Override
	public void saveGroup(Group group) {
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		
		/*for insert.*/
		if (group.getGroupId() == null) {
			group.setCreateUserId(user.getUserId());
			group.setCreateDate(updateDate);
		}
		group.setUpdateUserId(user.getUserId());
		group.setUpdateDate(updateDate);
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
