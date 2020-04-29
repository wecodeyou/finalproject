package com.it.wecodeyou.tag.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.tag.service.ITagService;

@RestController
@RequestMapping("/tag")
public class TagController {
	
	@Autowired
	private ITagService service;
	
	@GetMapping("")
	public ModelAndView interest() throws SQLException {
		ModelAndView mv = new ModelAndView();
		 
		ArrayList<TagVO>nameList = service.getAllTag();
		  
		mv.setViewName("tag/getAllTag");
		mv.addObject("nameList", nameList);
		
		return mv;
	}
	
	@ResponseBody
	 @PostMapping("/insertTag")
	 public String insertInterest(@RequestBody TagVO tvo, HttpSession session) throws SQLException {
			System.out.println("/tag/insertTag : 등록 POST 요청 발생!");
			System.out.println(tvo);
			String result = null;
			
			//중복검사
			Integer chk = service.checkTag(tvo.getTagName());
			if(chk == 0) { 
				service.insertTag(tvo); // insert tag 
				result = "success";
			}else if(chk == 1) { //이미 등록된 tag name라면
				result = "already exist";
			}
		 
		 return result;
	 }
	
	//@ResponseBody
	 @PostMapping("/checkTagDetail")
	 public Map<String, ArrayList<String>> checkTagDetail(@RequestBody String q) throws SQLException {
			System.out.println("/tag/checkTagDetail : 등록 POST 요청 발생!");
			System.out.println(q);
			
			Map<String, ArrayList<String>> retVal = new HashMap<String, ArrayList<String>>();
			//Map<String, ArrayList<String>> retValNo = new HashMap<String, ArrayList<String>>();
		    ArrayList<String> nameList = new ArrayList<>();
		    ArrayList<String> noList = new ArrayList<>();
		    for (int i = 0; i < service.checkTagDetail(q).size(); i++) {
				nameList.add(service.checkTagDetail(q).get(i).getTagName());
				noList.add(String.valueOf(service.checkTagDetail(q).get(i).getTagNo()));
				System.out.println(nameList.get(i));
			}
		    
		     if(nameList.size() == 0) {
		         System.out.println("비어있음");
		         nameList.add("no result");
		         retVal.put("list", nameList);
		      }else {
		         System.out.println("정보있음" );
		         retVal.put("nameList", nameList); //list란 키로 nameList의 값을 넣어줍니다.
		         retVal.put("noList", noList);
				 
		      }
			
		 return retVal;
	 }

}
