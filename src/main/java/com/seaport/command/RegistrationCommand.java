package com.seaport.command;

import java.util.LinkedHashMap;
import java.util.Map;

import com.seaport.domain.User;

public class RegistrationCommand {
	private User user = new User();
	private String pswordCheck = "";
	private Map<Integer, String> userPort = new LinkedHashMap<Integer,String>();
	private Map<Integer, String> userStevedor = new LinkedHashMap<Integer,String>();
	private Map<Integer, String> userOccupation = new LinkedHashMap<Integer,String>();
	boolean editForm;
	
	public boolean isEditForm() {
		return editForm;
	}

	public void setEditForm(boolean editForm) {
		this.editForm = editForm;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPswordCheck() {
		return pswordCheck;
	}

	public void setPswordCheck(String pswordCheck) {
		this.pswordCheck = pswordCheck;
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
