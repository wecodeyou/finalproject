package com.it.wecodeyou.schedule.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.schedule.model.ScheduleVO;

public interface IScheduleService {

	public ArrayList<ScheduleVO> getEvent(OffVO ovo) throws SQLException;

	public Integer insertEvent (ScheduleVO svo) throws SQLException;

	
}
