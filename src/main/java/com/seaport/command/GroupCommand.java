package com.seaport.command;

import java.util.ArrayList;
import java.util.List;

import com.seaport.domain.Group;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 08/12/14 <P>
 */

public class GroupCommand {
	private List<Group> groupList = new ArrayList<Group>();
	private Group currentGroup = new Group();
	private String successFlag = "false";
	
	public String getSuccessFlag() {
		return successFlag;
	}
	public void setSuccessFlag(String successFlag) {
		this.successFlag = successFlag;
	}
	public List<Group> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<Group> groupList) {
		this.groupList = groupList;
	}
	public Group getCurrentGroup() {
		return currentGroup;
	}
	public void setCurrentGroup(Group currentGroup) {
		this.currentGroup = currentGroup;
	}

	
}
