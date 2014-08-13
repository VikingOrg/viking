package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Group;

/**
 * The Service layer interface for Group requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 05/12/14
 *          
 */
public interface IGroupService {
	public Group getGroup(int groupId);
	public List<Group> getGroups();
	public void saveGroup(Group group);
	public Map<Integer, Group> getGroupMap();
}
