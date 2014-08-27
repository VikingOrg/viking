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

public class PortCommand {
	private List<Port> portList = new ArrayList<Port>();
	private Map<Integer, Country> countryMap = new LinkedHashMap<Integer,Country>();
	private Integer countryId;
	private Port port = new Port();
	private String successFlag = "false";
	
	public String getSuccessFlag() {
		return successFlag;
	}
	public void setSuccessFlag(String successFlag) {
		this.successFlag = successFlag;
	}
	public Port getPort() {
		return port;
	}
	public void setPort(Port port) {
		this.port = port;
	}
	
	public Map<Integer, Country> getCountryMap() {
		return countryMap;
	}
	public void setCountryMap(Map<Integer, Country> countryMap) {
		this.countryMap = countryMap;
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
