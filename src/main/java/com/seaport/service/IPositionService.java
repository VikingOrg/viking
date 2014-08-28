package com.seaport.service;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Position;

/**
 * The Service layer interface for Position requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 05/28/14
 *          
 */
public interface IPositionService {
	public Position getPosition(int positionId);
	public List<Position> getPositions();
	public void savePosition(Position position);
	public Map<Integer, Position> getPositionMap();
}
