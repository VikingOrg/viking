package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/05/13 <P>
 */

public class StevidorSearchCommand {
	
	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevidor> userStevidor = new LinkedHashMap<Integer,Stevidor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	private Integer portId;
	private Integer countryId;
	private List<Stevidor> stevidorList = new ArrayList<Stevidor>();

	
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

	public Map<Integer, Port> getUserPort() {
		return userPort;
	}

	public void setUserPort(Map<Integer, Port> userPort) {
		this.userPort = userPort;
	}

	public Map<Integer, Stevidor> getUserstevidor() {
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

	public List<Stevidor> getStevidorList() {
		return stevidorList;
	}

	public void setStevidorList(List<Stevidor> stevidorList) {
		this.stevidorList = stevidorList;
	}
	
	
}
