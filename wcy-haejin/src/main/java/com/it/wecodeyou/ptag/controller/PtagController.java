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
	public String insertTag(@RequestBody ArrayList<String> sendTagList) throws SQLException {
		System.out.println("/ptag/inserPtag : 등록 POST 요청 발생!");
		System.out.println("등록할 list: " + sendTagList);
		String no = null;
		
		//test용 productNo
		Integer productNo = 3;
		System.out.println("service.insertPtag 실행");
		Boolean chk = service.insertPtag(sendTagList, productNo);
		if(chk) {
			System.out.println("con: 완료");
		}else {
			System.out.println("con: 실패");
		}
			
		return no;
	}

}
