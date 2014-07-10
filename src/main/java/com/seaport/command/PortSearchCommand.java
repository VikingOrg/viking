package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Port;


/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/09/14 <P>
 */

public class PortSearchCommand {
	private List<Port> portList = new ArrayList<Port>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	private Integer countryId;
	
	public Map<Integer, Country> getUserCountry() {
		return userCountry;
	}

	public void setUserCountry(Map<Integer, Country> userCountry) {
		this.userCountry = userCountry;
	}

	public Integer getCountryId() {
		return countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	public List<Port> getPortList() {
		return portList;
	}

	public void setPortList(List<Port> portList) {
		this.portList = portList;
	}
	
	
}
