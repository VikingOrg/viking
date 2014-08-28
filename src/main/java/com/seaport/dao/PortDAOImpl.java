package com.seaport.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.domain.Port;

/**
 * The DAO class that serves any type of Port requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
@Repository
@Transactional
public class PortDAOImpl implements IPortDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public Port getPort(int portId) {
		Port port = (Port) getCurrentSession().get(Port.class, portId);
		return port;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Port> getPorts() {
		return getCurrentSession().createCriteria(Port.class).list();
	}

	@Override
	public void savePort(Port port) {
		getCurrentSession().saveOrUpdate(port);
	}

	@Override
	public Map<Integer, Port> getPortsMap() {
		Map<Integer, Port> portsMap = new LinkedHashMap<Integer, Port>();
		List<Port> portList = this.getPorts();
		for (Port port : portList) {
			portsMap.put(port.getPortId(), port);
		}
		return portsMap;
	}
}
