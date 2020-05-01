package com.it.wecodeyou.interest.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.it.wecodeyou.interest.model.InterestVO;
import com.it.wecodeyou.interest.sevice.IInterestService;
import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;


@RestController
@RequestMapping("/interest")
public class InterestController {
	
	@Autowired
	private IInterestService service;
	
	@ResponseBody
	 @PostMapping("/insertInterest")
	 public String insertInterest(@RequestBody InterestVO ivo, HttpSession session) throws SQLException {
			System.out.println("/interest/insertInterest : 등록 POST 요청 발생!");
			System.out.println(ivo);
			
			String result = null;
			System.out.println("login: " + ivo.getInterestUserNo());
			//중복검사
			Integer chk = service.checkUserNo(ivo.getInterestUserNo());
			System.out.println("중복검사결과: " + chk);
			
			if(chk == 0) { 
				
				if(service.insertInterest(ivo)) {
					System.out.println("insert interest 성공");
					
					if(service.updateInterest(ivo.getInterestUserNo())) {
						System.out.println("Update interest 성공");
						result = "success";
					}
					
				}
			}else if(chk == 1) { //이미 등록된 user no라면
				result = "already exist";
			}
		 
		 return result;
	 }
}
