package com.seaport.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.domain.Position;

/**
 * The DAO class that serves any type of Position requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Repository
@Transactional
public class PositionDAOImpl implements IPositionDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Position getPosition(int positionId) {
		Position position = (Position) getCurrentSession().get(Position.class, positionId);
		return position;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Position> getPositions(){
		Criteria criteria = getCurrentSession().createCriteria(Position.class);
		criteria.addOrder(Order.asc("order"));
		return criteria.list();
	}
	
	@Override
	public void savePosition(Position position) {
		getCurrentSession().saveOrUpdate(position);
	}
	
	@Override
	public Map<Integer, Position> getPositionMap(){
		Map<Integer, Position> positionMap = new LinkedHashMap<Integer, Position>();
		List<Position> positionList = this.getPositions();
		for (Position position : positionList) {
			positionMap.put(position.getPositionId(), position);
		}
		return positionMap;		
	}
		
}
