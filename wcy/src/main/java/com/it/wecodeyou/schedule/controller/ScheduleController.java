package com.it.wecodeyou.schedule.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.it.wecodeyou.off.service.IOffService;
import com.it.wecodeyou.schedule.model.ScheduleVO;
import com.it.wecodeyou.schedule.service.IScheduleService;

@RestController
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	IScheduleService scheduleService;
	@Autowired
	IOffService offService;
	
	@GetMapping("/")
	public String schedule(Model model) throws SQLException {
		
//		model.addAttribute("el",dao.getEvent());
		
		return "schedule/calendar";
	}
	
	@PostMapping("/add")
	public String add(@RequestBody ScheduleVO svo) throws SQLException {
		

		
		if (scheduleService.insertEvent(svo) == 1) {
			return "success";
		}else
			return "fail";
		
		
	}
}
