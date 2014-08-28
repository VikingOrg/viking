package com.seaport.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seaport.dao.IPositionDAO;
import com.seaport.domain.Position;
import com.seaport.domain.User;

/**
 * The Service layer interface for Position requests 
 * 
 * @Author Danil Ozherelyev
 * @version 1.0 08/12/14
 *          
 */
@Service
public class PositionServiceImpl implements IPositionService {
	@Autowired
	private IPositionDAO positionDAO;
	@Autowired
	private IUserService userService;
	
	public Position getPosition(int positionId){
		return positionDAO.getPosition(positionId);
	}
	
	public List<Position> getPositions() {
		return positionDAO.getPositions();
	}
	
	public void savePosition(Position position){
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = userService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		
		/*for insert.*/
		if (position.getPositionId() == null) {
			position.setCreateUserId(user.getUserId());
			position.setCreateDate(updateDate);
		}
		position.setUpdateUserId(user.getUserId());
		position.setUpdateDate(updateDate);
		positionDAO.savePosition(position);
	}
	public Map<Integer, Position> getPositionMap(){
		return positionDAO.getPositionMap();
	}
}
