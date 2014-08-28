package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Port;

/**
 * The Service layer interface for Port requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 12/04/13
 *          
 */
public interface IPortService {
	public Port getPort(int portId);
	public List<Port> getPorts();
	public void savePort(Port port);
	public Map<Integer, Port> getPortsMap();
}
