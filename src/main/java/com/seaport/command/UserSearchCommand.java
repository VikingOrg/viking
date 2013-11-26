package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.User;

public class UserSearchCommand {
	private List<User> userList = new ArrayList<User>();
	
	private Map<Integer, String> userPort = new LinkedHashMap<Integer,String>();
	private Map<Integer, String> userStevedor = new LinkedHashMap<Integer,String>();
	private Map<Integer, String> userOccupation = new LinkedHashMap<Integer,String>();

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public Map<Integer, String> getUserPort() {
		return userPort;
	}

	public void setUserPort(Map<Integer, String> userPort) {
		this.userPort = userPort;
	}

	public Map<Integer, String> getUserStevedor() {
		return userStevedor;
	}

	public void setUserStevedor(Map<Integer, String> userStevedor) {
		this.userStevedor = userStevedor;
	}

	public Map<Integer, String> getUserOccupation() {
		return userOccupation;
	}

	public void setUserOccupation(Map<Integer, String> userOccupation) {
		this.userOccupation = userOccupation;
	}
}
