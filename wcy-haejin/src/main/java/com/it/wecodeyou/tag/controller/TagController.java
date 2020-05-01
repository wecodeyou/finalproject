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
	
	//@ResponseBody
	 @PostMapping("/checkTagDetail")
	 public Map<String, ArrayList<String>> checkTagDetail(@RequestBody String q) throws SQLException {
			System.out.println("/tag/checkTagDetail : 등록 POST 요청 발생!");
			
			Map<String, ArrayList<String>> retVal = new HashMap<String, ArrayList<String>>();
			
		    ArrayList<String> nameList = new ArrayList<>();
		    ArrayList<String> noList = new ArrayList<>();
		    
		    for (int i = 0; i < service.checkTagDetail(q).size(); i++) {
				nameList.add(service.checkTagDetail(q).get(i).getTagName());
				noList.add(String.valueOf(service.checkTagDetail(q).get(i).getTagNo()));
			}
		    
		     if(nameList.size() == 0) {
		         nameList.add(q);
		         noList.add("no result");
		      }
		     
	         retVal.put("nameList", nameList); //nameList 태그명
	         retVal.put("noList", noList); //noList 태그 넘버명 (현재 문자열 배열)
			
		 return retVal;
	 }
	 
	@PostMapping("/insertTag")
	public String insertTag(@RequestBody String tag) throws SQLException {
		System.out.println("/tag/insertTag : 등록 POST 요청 발생!");
		System.out.println("등록할 name: " + tag);
		
			Boolean chk = service.insertTag(tag); 
			String no = null;
			if(chk) {
				no = String.valueOf(service.checkTagDetail(tag).get(0).getTagNo());
			}else {
				no = "fail";
			}
			
		return no;
	}
		

}
