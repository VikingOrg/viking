package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.dto.CompanyReportDTO;
import com.seaport.dto.GroupReportDTO;
import com.seaport.dto.ManufacturerReportDTO;


/**
 * The DAO interface for Report requests
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/15/14
 *          
 */
public interface IReportDAO {
	public List<GroupReportDTO> getGroupReportDTOs(Map<String, Object> filtersMap);
	public List<CompanyReportDTO> getCompanyReportDTOs(Map<String, Object> filtersMap);
	public List<ManufacturerReportDTO> getManufacturerReportDTOs(Map<String, Object> filtersMap);
}
