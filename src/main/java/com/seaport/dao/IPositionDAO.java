package com.seaport.dao;

import java.util.List;
import java.util.Map;

import com.seaport.domain.Position;

/**
 * The DAO interface for Position requests
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/28/14
 *          
 */
public interface IPositionDAO {
	public Position getPosition(int positionId);
	public List<Position> getPositions();
	public void savePosition(Position position);
	public Map<Integer, Position> getPositionMap();
}
