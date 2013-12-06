package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;

import com.seaport.domain.Country;
import com.seaport.domain.Port;
import com.seaport.domain.Stevedor;
import com.seaport.domain.UserDTO;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */
public class UserSearchCommand {
	
	private List<UserDTO> userDtoList = new ArrayList<UserDTO>();
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevedor> userStevedor = new LinkedHashMap<Integer,Stevedor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	
	private Integer portId;
	private Integer countryId;
	private Integer stevedorId;


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

	public Integer getStevedorId() {
		return stevedorId;
	}

	public void setStevedorId(Integer stevedorId) {
		this.stevedorId = stevedorId;
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

	public List<UserDTO> getUserDtoList() {
		return userDtoList;
	}

	public void setUserDtoList(List<UserDTO> userDtoList) {
		this.userDtoList = userDtoList;
	}
	
}
