package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;
import com.seaport.domain.User;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */
public class UserSearchCommand {
	
	private List<User> userList = new ArrayList<User>();
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevidor> userStevidor = new LinkedHashMap<Integer,Stevidor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	
	private Integer portId;
	private Integer countryId;
	private Integer stevidorId;
	private Integer userId;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public Integer getPortId() {
		return portId;
	}

	public void setPortId(Integer portId) {
		this.portId = portId;
	}

	public Integer getCountryId() {
		return countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	public Integer getStevidorId() {
		return stevidorId;
	}

	public void setStevidorId(Integer stevidorId) {
		this.stevidorId = stevidorId;
	}

	public Map<Integer, Port> getUserPort() {
		return userPort;
	}

	public void setUserPort(Map<Integer, Port> userPort) {
		this.userPort = userPort;
	}

	public Map<Integer, Stevidor> getUserStevidor() {
		return userStevidor;
	}

	public void setUserStevidor(Map<Integer, Stevidor> userStevidor) {
		this.userStevidor = userStevidor;
	}

	public Map<Integer, Country> getUserCountry() {
		return userCountry;
	}

	public void setUserCountry(Map<Integer, Country> userCountry) {
		this.userCountry = userCountry;
	}

}
