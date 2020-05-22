package com.it.wecodeyou.schedule.repository;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.schedule.model.ScheduleVO;

public interface IScheduleMapper {

	
	public ArrayList<ScheduleVO> getEvent(OffVO ovo) throws SQLException;
	
	public Integer insertEvent (ScheduleVO svo)throws SQLException;
	
	public ArrayList<ScheduleVO> getOneSchedule(OffVO ovo) throws SQLException;
}
