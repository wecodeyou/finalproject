package com.it.wecodeyou.interest_list.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.interest_list.model.Interest_ListVO;
import com.it.wecodeyou.interest_list.service.IInterest_ListService;

@RestController
@RequestMapping("/interest_list")
public class Interest_ListController {

	@Autowired
	private IInterest_ListService service;
	  
		@GetMapping("")
		public ModelAndView interest() throws SQLException {
			ModelAndView mv = new ModelAndView();
			 
			ArrayList<Interest_ListVO>typeList = service.getOneInterestType();
			ArrayList<Interest_ListVO>allInterest = service.getAllInterestList();
			  
			mv.setViewName("interest/interest-form");
			mv.addObject("typeList", typeList);
			mv.addObject("allInterest", allInterest);
			
			return mv;
		}
	 
}
