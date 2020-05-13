package com.it.wecodeyou.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.purchase.model.PurchaseResultVO;
import com.it.wecodeyou.purchase.service.IPurchaseService;

@RestController
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IPurchaseService purchaseService;
	
   	//admin page 호출
   	@GetMapping("")
	public ModelAndView admin(ModelAndView mv) throws SQLException {
   		System.out.println("/admin : GET 요청 발생!");
   		
   		//이 달, 올 해의 통계
   		PurchaseResultVO thisMonthly = purchaseService.getThisMonthlyEarnings();
   		mv.addObject("thisMonthly", thisMonthly);
   		mv.addObject("thisAnnual", purchaseService.getThisAnnualEarnings());
   		//전체 통계
   		mv.addObject("monthly", purchaseService.getMonthlyEarnings());
   		mv.addObject("annual", purchaseService.getAnnualEarnings());
   		mv.setViewName("admin/adminpage");
   		return mv;
   	}
   	
   	@PostMapping("/getMonthlyReport")
	public Map<String, ArrayList<String>> getMonthlyReport(@RequestBody String q) throws SQLException {
   		System.out.println("/admin/getMonthlyReport : GET 요청 발생!");
   		System.out.println(q);
   		//통계 결과 담을 map
   		Map<String, ArrayList<String>> retVal = new HashMap<String, ArrayList<String>>();
   		
		ArrayList<PurchaseResultVO> prvoList = purchaseService.getMonthlyEarnings();

		ArrayList<String> monthList = new ArrayList<>();
		ArrayList<String> earningList = new ArrayList<>();
		for (int i = 0; i < prvoList.size(); i++) {
			monthList.add(prvoList.get(i).getPurchaseM());
			earningList.add(String.valueOf(prvoList.get(i).getEarningMonthly()));
			System.out.println(monthList.get(i) + "월 " + earningList.get(i) + "원");
		}
		retVal.put("monthList", monthList);
		retVal.put("earningList", earningList);
   		
   		return retVal;
   	}
   	
   	
   	//user page 호출
   	@GetMapping("/user")
	public ModelAndView user(ModelAndView mv) throws SQLException {
   		System.out.println("/user : GET 요청 발생!");
   		
   		
   		mv.addObject("members",memberService.getAllInfo());
   		mv.setViewName("admin/user");
   		return mv;
   	}
   	
   	//etc page 호출
   	@GetMapping("/etc")
	public ModelAndView etc(ModelAndView mv) throws SQLException {
   		System.out.println("/etc : GET 요청 발생!");
   		//
   		
   		mv.setViewName("admin/etc");
   		return mv;
   	}

}
