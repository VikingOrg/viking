package com.seaport.dao;

import java.math.BigInteger;
import java.text.NumberFormat;
import java.util.List;
import java.util.Map;

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
import com.seaport.utils.VikingConstant;

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
		double percentage;
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("SELECT b.stevidor_id AS stevidorId, b.full_name AS name, COUNT(a.stevidor_id) AS count, '' AS math ");
		strBuilder.append("FROM machines a RIGHT JOIN stevidors b ON a.stevidor_id = b.stevidor_id ");
		strBuilder.append("LEFT JOIN models ON a.model_id = models.model_id ");
		
		/*Starting filter logic.*/
		if (filtersMap.size() > 0) {
			strBuilder.append(getFilterWhereClause(filtersMap));
		}
		strBuilder.append("GROUP BY b.stevidor_id ORDER BY b.stevidor_id");
		Query query = openSession().createSQLQuery(strBuilder.toString()).setResultTransformer(Transformers.aliasToBean(CompanyReportDTO.class));
		List<CompanyReportDTO> result = query.list();
		
		/*Calculating & populating percentage for each record*/
		BigInteger countTotal = BigInteger.ZERO;
		for (CompanyReportDTO companyReportDTO : result) {
			countTotal = countTotal.add(companyReportDTO.getCount());
		}
		NumberFormat percentFormat = NumberFormat.getPercentInstance();
		percentFormat.setMaximumFractionDigits(1);
		for (CompanyReportDTO companyReportDTO : result) {
			percentage = (companyReportDTO.getCount().doubleValue()/ countTotal.doubleValue());
			companyReportDTO.setMath(percentFormat.format(percentage));
		}
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<GroupReportDTO> getGroupReportDTOs(Map<String, Object> filtersMap) {
		double percentage;
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("SELECT models.group_id AS groupId, c.name, COUNT(models.group_id) AS count, '' AS math ");
		strBuilder.append("FROM machines a JOIN models ON a.model_id = models.model_id ");
		strBuilder.append("LEFT JOIN groups c ON models.group_id = c.group_id ");
		
		/*Starting filter logic.*/
		if (filtersMap.size() > 0) {
			strBuilder.append(getFilterWhereClause(filtersMap));
		}		
		strBuilder.append("GROUP BY models.group_id ORDER BY models.group_id");
		Query query = openSession().createSQLQuery(strBuilder.toString()).setResultTransformer(Transformers.aliasToBean(GroupReportDTO.class));
		List<GroupReportDTO> result = query.list();

		/*Calculating & populating percentage for each record*/
		BigInteger countTotal = BigInteger.ZERO;
		for (GroupReportDTO groupReportDTO : result) {
			countTotal = countTotal.add(groupReportDTO.getCount());
		}
		NumberFormat percentFormat = NumberFormat.getPercentInstance();
		percentFormat.setMaximumFractionDigits(1);
		for (GroupReportDTO groupReportDTO : result) {
			percentage = (groupReportDTO.getCount().doubleValue()/ countTotal.doubleValue());
			groupReportDTO.setMath(percentFormat.format(percentage));
		}

		return result;
	}
	
	@SuppressWarnings("unchecked")
	@Override	
	public List<ManufacturerReportDTO> getManufacturerReportDTOs(Map<String, Object> filtersMap){
		double percentage;
		StringBuilder strBuilder = new StringBuilder();
		strBuilder.append("SELECT c.manufacturer_id AS manufacturerId, c.name_rus AS name, COUNT(models.manufacturer_id) AS count, '' AS math ");
		strBuilder.append("FROM machines a JOIN models ON a.model_id = models.model_id ");
		strBuilder.append("RIGHT JOIN manufacturers c ON models.manufacturer_id = c.manufacturer_id ");
		/*Starting filter logic.*/
		if (filtersMap.size() > 0) {
			strBuilder.append(getFilterWhereClause(filtersMap));
		}		
		strBuilder.append("GROUP BY c.manufacturer_id ORDER BY c.manufacturer_id");
		Query query = openSession().createSQLQuery(strBuilder.toString()).setResultTransformer(Transformers.aliasToBean(ManufacturerReportDTO.class));
		List<ManufacturerReportDTO> result = query.list();
		
		/*Calculating & populating percentage for each record*/
		BigInteger countTotal = BigInteger.ZERO;
		for (ManufacturerReportDTO manufacturerReportDTO : result) {
			countTotal = countTotal.add(manufacturerReportDTO.getCount());
		}
		NumberFormat percentFormat = NumberFormat.getPercentInstance();
		percentFormat.setMaximumFractionDigits(1);
		for (ManufacturerReportDTO manufacturerReportDTO : result) {
			percentage = (manufacturerReportDTO.getCount().doubleValue()/ countTotal.doubleValue());
			manufacturerReportDTO.setMath(percentFormat.format(percentage));
		}		
		return result;
	}
	
	/**
	 * Composes filters where clause for report queries.
	 * @param filtersMap
	 * @return
	 */
	private String getFilterWhereClause(Map<String, Object> filtersMap){
		StringBuilder strWhereClauseBuilder = new StringBuilder();
		strWhereClauseBuilder.append("WHERE ");
		boolean andRequired = false;
		/*Setting filters here*/
		if (filtersMap.containsKey(VikingConstant.COMPANY_MULTI_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			strWhereClauseBuilder.append("a.stevidor_id in (");
			String[] companySelectionIds = (String[])filtersMap.get(VikingConstant.COMPANY_MULTI_FILTER);
			for (String strElement: companySelectionIds) {
				strWhereClauseBuilder.append(strElement).append(",");
		    }
			strWhereClauseBuilder.deleteCharAt(strWhereClauseBuilder.length() - 1);
			strWhereClauseBuilder.append(") ");
			andRequired = true;
		}
		if (filtersMap.containsKey(VikingConstant.COMPANY_SINGLE_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			Integer filterValue = (Integer)filtersMap.get(VikingConstant.COMPANY_SINGLE_FILTER);
			strWhereClauseBuilder.append("a.stevidor_id = ").append(filterValue).append(" ");
			andRequired = true;
		}		
		if (filtersMap.containsKey(VikingConstant.GROUP_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			Integer filterValue = (Integer)filtersMap.get(VikingConstant.GROUP_FILTER);
			strWhereClauseBuilder.append("models.group_id = ").append(filterValue).append(" ");
			andRequired = true;
		}
		if (filtersMap.containsKey(VikingConstant.MODEL_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			Integer filterValue = (Integer)filtersMap.get(VikingConstant.MODEL_FILTER);
			strWhereClauseBuilder.append("a.model_id = ").append(filterValue).append(" ");
			andRequired = true;
		}
		if (filtersMap.containsKey(VikingConstant.MANUFACTOR_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			Integer filterValue = (Integer)filtersMap.get(VikingConstant.MANUFACTOR_FILTER);
			strWhereClauseBuilder.append("models.manufacturer_id = ").append(filterValue).append(" ");
			andRequired = true;
		}
		if (filtersMap.containsKey(VikingConstant.YEAR_START_FILTER) && filtersMap.containsKey(VikingConstant.YEAR_END_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			strWhereClauseBuilder.append("a.release_year BETWEEN ");
			String filterValueOne = (String)filtersMap.get(VikingConstant.YEAR_START_FILTER);
			String filterValueTwo = (String)filtersMap.get(VikingConstant.YEAR_END_FILTER);
			strWhereClauseBuilder.append(filterValueOne).append(" AND ").append(filterValueTwo).append(" ");
			andRequired = true;
		} else if (filtersMap.containsKey(VikingConstant.YEAR_START_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			String filterValue = (String)filtersMap.get(VikingConstant.YEAR_START_FILTER);
			strWhereClauseBuilder.append("a.release_year >= ").append(filterValue).append(" ");
			andRequired = true;				
		} else if (filtersMap.containsKey(VikingConstant.YEAR_END_FILTER)) {
			if (andRequired) {
				strWhereClauseBuilder.append("AND ");
			}
			String filterValue = (String)filtersMap.get(VikingConstant.YEAR_END_FILTER);
			strWhereClauseBuilder.append("a.release_year <= ").append(filterValue).append(" ");
			andRequired = true;				
		}
		return strWhereClauseBuilder.toString();
	}
}








