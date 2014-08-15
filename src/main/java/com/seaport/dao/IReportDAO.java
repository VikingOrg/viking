package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.dto.GroupReportDTO;


/**
 * The DAO interface for Report requests
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/15/14
 *          
 */
public interface IReportDAO {
	public List<GroupReportDTO> getGroupReportDTOs(Map<String, Object> filtersMap);
}
