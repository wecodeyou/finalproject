package com.it.wecodeyou.ptag.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.it.wecodeyou.ptag.service.IPtagService;

@RestController
@RequestMapping("/ptag")
public class PtagController {
	
	@Autowired
	private IPtagService service;
	
	@PostMapping("/insertPtag")
	public String insertTag(@RequestBody ArrayList<Integer> sendTagList) throws SQLException {
		System.out.println("/ptag/inserPtag : 등록 POST 요청 발생!");
		System.out.println("등록할 list: " + sendTagList);
		String result = null;
		
		//test용 productNo
		Integer productNo = 3;
		
		Boolean chk = service.insertPtag(sendTagList, productNo);
		
		if(chk) {
			result = "success";
		}else {
			result = "fail";
		}
		return result;
	}

}
