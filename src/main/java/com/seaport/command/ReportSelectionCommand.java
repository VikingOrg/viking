package com.seaport.command;

import java.util.LinkedHashMap;
import java.util.Map;

import com.seaport.domain.Country;
import com.seaport.domain.Group;
import com.seaport.domain.MachineModel;
import com.seaport.domain.Manufacturer;
import com.seaport.domain.Port;
import com.seaport.domain.Stevidor;

/**
 * The abstract form class contains common data to be shared by others 
 * form classes in the presentation layer.<P>
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 07/15/14 <P>
 */

public class ReportSelectionCommand {

	private Map<Integer, Port> userPort = new LinkedHashMap<Integer,Port>();
	private Map<Integer, Stevidor> stevidorMap = new LinkedHashMap<Integer,Stevidor>();
	private Map<Integer, Country> userCountry = new LinkedHashMap<Integer,Country>();
	private Map<Integer, Group> groupMap = new LinkedHashMap<Integer, Group>();
	private Map<Integer, Manufacturer> manufacturerMap = new LinkedHashMap<Integer, Manufacturer>();
	private Map<Integer, Integer> yearMap = new LinkedHashMap<Integer, Integer>();
	private Map<Integer, MachineModel> machineModelMap = new LinkedHashMap<Integer, MachineModel>();
	
	private Integer groupId;
	private Integer portId;
	private Integer countryId;
	private String[] stevidorSelection;
	private Integer releaseYear;
	private Integer manufacturerId;
	private Integer reportType;
	private Integer modelId;
	
    private Map<Integer, String> reportSelection = new LinkedHashMap<Integer, String>();
    
    public ReportSelectionCommand() {
    	reportSelection.put(1, "По группам");
    	reportSelection.put(2, "По движению");
    	reportSelection.put(3, "По колличеству");
    	
    }

	public String[] getStevidorSelection() {
		return stevidorSelection;
	}

	public void setStevidorSelection(String[] stevidorSelection) {
		this.stevidorSelection = stevidorSelection;
	}

	public Map<Integer, Stevidor> getStevidorMap() {
		return stevidorMap;
	}

	public void setStevidorMap(Map<Integer, Stevidor> stevidorMap) {
		this.stevidorMap = stevidorMap;
	}

	public Map<Integer, MachineModel> getMachineModelMap() {
		return machineModelMap;
	}

	public void setMachineModelMap(Map<Integer, MachineModel> machineModelMap) {
		this.machineModelMap = machineModelMap;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public Map<Integer, String> getReportSelection() {
		return reportSelection;
	}

	public void setReportSelection(Map<Integer, String> reportSelection) {
		this.reportSelection = reportSelection;
	}

	public Integer getReportType() {
		return reportType;
	}
	public void setReportType(Integer reportType) {
		this.reportType = reportType;
	}

	public Integer getManufacturerId() {
		return manufacturerId;
	}
	public void setManufacturerId(Integer manufacturerId) {
		this.manufacturerId = manufacturerId;
	}
	public Map<Integer, Port> getUserPort() {
		return userPort;
	}
	public void setUserPort(Map<Integer, Port> userPort) {
		this.userPort = userPort;
	}

	public Map<Integer, Country> getUserCountry() {
		return userCountry;
	}
	public void setUserCountry(Map<Integer, Country> userCountry) {
		this.userCountry = userCountry;
	}
	public Map<Integer, Group> getGroupMap() {
		return groupMap;
	}
	public void setGroupMap(Map<Integer, Group> groupMap) {
		this.groupMap = groupMap;
	}
	public Map<Integer, Manufacturer> getManufacturerMap() {
		return manufacturerMap;
	}
	public void setManufacturerMap(Map<Integer, Manufacturer> manufacturerMap) {
		this.manufacturerMap = manufacturerMap;
	}
	public Map<Integer, Integer> getYearMap() {
		return yearMap;
	}
	public void setYearMap(Map<Integer, Integer> yearMap) {
		this.yearMap = yearMap;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
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
	public Integer getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(Integer releaseYear) {
		this.releaseYear = releaseYear;
	}

}
