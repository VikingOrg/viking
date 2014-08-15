package com.seaport.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dto.GroupReportDTO;

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
	
}
