package com.it.wecodeyou.schedule.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.off.repository.IOffMapper;
import com.it.wecodeyou.schedule.model.ScheduleVO;
import com.it.wecodeyou.schedule.repository.IScheduleMapper;

@Service
public class ScheduleService implements IScheduleService{

	@Autowired
	private IScheduleMapper dao;
	
	@Autowired
	private IOffMapper offdao;
	
	public ArrayList<ScheduleVO> getEvent(OffVO ovo) throws SQLException{
		
		return dao.getEvent(ovo);	
		
	}

	@Override
	public Integer insertEvent(ScheduleVO svo) throws SQLException {

		Integer rowNo = 1;
		
		ArrayList<ScheduleVO> scheduleList = dao.getEvent(offdao.getOneInfo(svo.getScheduleOffNo()));

		if (scheduleList.size() == 0) {
			svo.setScheduleRowNo(rowNo);
		}else {
			rowNo += scheduleList.size();
			svo.setScheduleRowNo(rowNo);
		}
		
		
		return dao.insertEvent(svo);
		
	}

	@Override
	public ArrayList<ScheduleVO> getOneSchedule(OffVO ovo) throws SQLException {
		// TODO Auto-generated method stub
		return dao.getOneSchedule(ovo);
	}

	
	
}
