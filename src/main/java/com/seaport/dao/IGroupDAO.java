package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Group;

/**
 * The DAO interface for Group requests
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
public interface IGroupDAO {
	public Group getGroup(int groupId);
	public List<Group> getGroups();
	public void saveGroup(Group group);
	public Map<Integer, Group> getGroupMap();
}
