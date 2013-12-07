package com.seaport.command;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.seaport.domain.Country;
import com.seaport.domain.Port;
import com.seaport.domain.Stevedor;
import com.seaport.domain.User;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class RegistrationCommand {
	
	@NotNull
	@Valid
	private User user = new User();
	private String pswordCheck = "";
	
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevedor> userStevedor = new LinkedHashMap<Integer,Stevedor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	private String formType = "N"; 
	private Integer userRole;
	
	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
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

	public Map<Integer, Port> getUserPort() {
		return userPort;
	}

	public void setUserPort(Map<Integer, Port> userPort) {
		this.userPort = userPort;
	}

	public Map<Integer, Stevedor> getUserStevedor() {
		return userStevedor;
	}

	public void setUserStevedor(Map<Integer, Stevedor> userStevedor) {
		this.userStevedor = userStevedor;
	}

	public Map<Integer, Country> getUserCountry() {
		return userCountry;
	}

	public void setUserCountry(Map<Integer, Country> userCountry) {
		this.userCountry = userCountry;
	}




	
}
