package com.seaport.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IGroupDAO;
import com.seaport.domain.Group;

/**
 * The Service layer interface for Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Service
@Transactional
public class GroupServiceImpl implements IGroupService {
	@Autowired
	private IGroupDAO groupDAO;
	
	public Group getGroup(int groupId){
		return groupDAO.getGroup(groupId);
	}
	
	public List<Group> getGroups() {
		return groupDAO.getGroups();
	}
	
	public void saveGroup(Group group){
		groupDAO.saveGroup(group);
	}
	public Map<Integer, Group> getGroupMap(){
		return groupDAO.getGroupMap();
	}
}
