package com.seaport.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
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
	private String releaseYear;
	private Integer manufacturerId;
	private Integer reportType;
	private Integer modelId;
	
	private String groupName = "Все группы";
	private String modelName = "Все модели";
	private String relYearName = "Все года";
	private String manufactName = "Все производители";
	private Integer totalMachineCount = 0;
	private String reportTypeCode = "";
	
    private Map<Integer, String> reportSelection = new LinkedHashMap<Integer, String>();
    public ReportSelectionCommand() {
    	reportSelection.put(1, "По группам");
    	reportSelection.put(2, "По движению");
    	reportSelection.put(3, "По колличеству");
    }

    
    public String getReportTypeCode() {
		return reportTypeCode;
	}
	public void setReportTypeCode(String reportTypeCode) {
		this.reportTypeCode = reportTypeCode;
	}
	
	private List<String[]> companyReport= new ArrayList<String[]>();
    
	public Integer getTotalMachineCount() {
		return totalMachineCount;
	}
	public void setTotalMachineCount(Integer totalMachineCount) {
		this.totalMachineCount = totalMachineCount;
	}
	public List<String[]> getCompanyReport() {
		return companyReport;
	}
	public void setCompanyReport(List<String[]> companyReport) {
		this.companyReport = companyReport;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getRelYearName() {
		return relYearName;
	}
	public void setRelYearName(String relYearName) {
		this.relYearName = relYearName;
	}
	public String getManufactName() {
		return manufactName;
	}
	public void setManufactName(String manufactName) {
		this.manufactName = manufactName;
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
	public String getReleaseYear() {
		return releaseYear;
	}
	public void setReleaseYear(String releaseYear) {
		this.releaseYear = releaseYear;
	}


}
