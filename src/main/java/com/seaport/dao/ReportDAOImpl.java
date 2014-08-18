package com.seaport.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dto.CompanyReportDTO;
import com.seaport.dto.GroupReportDTO;
import com.seaport.dto.ManufacturerReportDTO;
import com.seaport.utils.SystemConstants;

/**
 * The DAO class that serves any type of User requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Repository
@Transactional
public class ReportDAOImpl implements IReportDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session openSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CompanyReportDTO> getCompanyReportDTOs(Map<String, Object> filtersMap) {
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("SELECT b.stevidor_id AS stevidorId, b.full_name AS name, COUNT(*) AS count ");
		strBuilder.append("FROM machines a RIGHT JOIN stevidors b ON a.stevidor_id = b.stevidor_id ");
		/*Starting filter logic.*/
		if (filtersMap.size() > 0) {
			strBuilder.append("WHERE ");
			boolean andRequired = false;
			if (filtersMap.containsKey(SystemConstants.COMPANY_MULTI_FILTER)) {
				if (andRequired) {
					strBuilder.append("AND ");
				}
				strBuilder.append("a.stevidor_id in (");
				String[] companySelectionIds = (String[])filtersMap.get(SystemConstants.COMPANY_MULTI_FILTER);
				for (String strElement: companySelectionIds) {
					strBuilder.append(strElement).append(",");
			    }
				strBuilder.deleteCharAt(strBuilder.length() - 1);
				strBuilder.append(") ");
				andRequired = true;
			}
			if (filtersMap.containsKey(SystemConstants.GROUP_FILTER)) {
				if (andRequired) {
					strBuilder.append("AND ");
				}
				Integer filterValue = (Integer)filtersMap.get(SystemConstants.GROUP_FILTER);
				strBuilder.append("a.group_id = ").append(filterValue).append(" ");
				andRequired = true;
			}
		}

		strBuilder.append("GROUP BY b.stevidor_id ORDER BY b.stevidor_id");
		Query query = openSession().createSQLQuery(strBuilder.toString()).setResultTransformer(Transformers.aliasToBean(CompanyReportDTO.class));
		List<CompanyReportDTO> result = query.list();
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<GroupReportDTO> getGroupReportDTOs(Map<String, Object> filtersMap) {
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("SELECT b.group_id AS groupId, b.name, COUNT(*) AS count ");
		strBuilder.append("FROM machines a RIGHT JOIN groups b ON a.group_id = b.group_id ");
		strBuilder.append("");
		strBuilder.append("GROUP BY b.group_id ORDER BY b.group_id");
		Query query = openSession().createSQLQuery(strBuilder.toString()).setResultTransformer(Transformers.aliasToBean(GroupReportDTO.class));
		List<GroupReportDTO> result = query.list();
		
//		"select s.stock_code from stock s where s.stock_code = :stockCode")
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override	
	public List<ManufacturerReportDTO> getManufacturerReportDTOs(Map<String, Object> filtersMap){
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("SELECT c.manufacturer_id AS manufacturerId, c.name_rus AS name, COUNT(*) AS count ");
		strBuilder.append("FROM machines a JOIN models b ON a.model_id = b.model_id ");
		strBuilder.append("RIGHT JOIN manufacturers c ON b.manufacturer_id = c.manufacturer_id ");
		strBuilder.append("GROUP BY c.manufacturer_id ORDER BY c.manufacturer_id");
		Query query = openSession().createSQLQuery(strBuilder.toString()).setResultTransformer(Transformers.aliasToBean(ManufacturerReportDTO.class));
		List<ManufacturerReportDTO> result = query.list();
		return result;
	}
	
}








