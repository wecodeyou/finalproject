package com.it.wecodeyou.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.interest.model.InterestReportVO;
import com.it.wecodeyou.interest.sevice.IInterestService;
import com.it.wecodeyou.member.model.MemberVO;
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
	@Autowired
	private IInterestService interestService;

	
   	//admin page 호출
   	@GetMapping("")
	public ModelAndView admin(ModelAndView mv) throws SQLException {
   		System.out.println("/admin : GET 요청 발생!");
   		List<InterestReportVO> reportList = new ArrayList<>();
   		// goal의 답 종류들
   		List<String> goalList = interestService.getInterestsByType("goal");
   		Integer total = interestService.getInterestReportByIndex("interest_index5").get(0).getCnt();
   		
   		for (int i = 0; i < goalList.size(); i++) {
   			Integer cnt = interestService.countAnswer(goalList.get(i));
			InterestReportVO irvo = new InterestReportVO(interestService.getAnswer(goalList.get(i)), cnt);
			reportList.add(irvo);
			System.out.println(reportList.toString());
		}
   		mv.addObject("total", total);
   		mv.addObject("reportList", reportList);
   		
   		//이 달, 올 해의 통계
   		PurchaseResultVO thisMonthly = purchaseService.getThisMonthlyEarnings();
   		mv.addObject("thisMonthly", thisMonthly);
   		mv.addObject("thisAnnual", purchaseService.getThisAnnualEarnings());
   		//전체 통계
   		mv.addObject("monthly", purchaseService.getMonthlyEarnings());
   		mv.addObject("annual", purchaseService.getAnnualEarnings());
   		
   		//멤버
   		mv.addObject("members",memberService.getAllInfo());
   		
   		mv.setViewName("admin/adminpage");
   		return mv;
   	}
   	
	@PostMapping("/getMonthlyEarning")
	public ArrayList<Integer> getMonthlyEarning() throws SQLException {
		System.out.println("/admin/getMonthlyReport : POST 요청 발생!"); 

		ArrayList<PurchaseResultVO> prvoList = purchaseService.getMonthlyEarnings();

		ArrayList<Integer> earningList = new ArrayList<>();
		for (int i = 0; i < prvoList.size(); i++) {
			earningList.add(prvoList.get(i).getEarningMonthly());
		}

		return earningList;
	}
	
	@PostMapping("/getInterestLanguage")
	public Map<String, Integer> getInterestLanguage() throws SQLException {
		System.out.println("/admin/getInterestLanguage : POST 요청 발생!"); 

		Map<String, Integer> retVal = new HashMap<String, Integer>();
		
		// lang의 답 종류들
		List<String> langList = interestService.getInterestsByType("lang");
		for (int i = 0; i < langList.size(); i++) {
			Integer cnt = interestService.countAnswer(langList.get(i));
			retVal.put(interestService.getAnswer(langList.get(i)), cnt);
		}
		
		return retVal;
	}
	
	@PostMapping("/getInterestFunnels")
	public Map<String, Integer> getInterestFunnels() throws SQLException {
		System.out.println("/admin/getInterestFunnels : POST 요청 발생!"); 

		Map<String, Integer> retVal = new HashMap<String, Integer>();
		
		// funnels의 답 종류들
		List<String> funnelList = interestService.getInterestsByType("funnel");
		for (int i = 0; i < funnelList.size(); i++) {
			Integer cnt = interestService.countAnswer(funnelList.get(i));
			retVal.put(interestService.getAnswer(funnelList.get(i)), cnt);
		}
		
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

	/*
	 * @GetMapping("/typechange") public ModelAndView typechange(HttpServletRequest
	 * req) throws SQLException {
	 * 
	 * Integer userNo = Integer.parseInt(req.getParameter("userNo")); MemberVO mvo =
	 * memberService.getOneInfo(userNo);
	 * 
	 * memberService.changeUserType(mvo);
	 * 
	 * return new ModelAndView("redirect:/admin");
	 * 
	 * }
	 */
   	
    //로그인 요청 처리
    @PostMapping("/typechange")
    public String typechange(@RequestBody Integer usertype, HttpSession session) throws SQLException {
       System.out.println("/member/typechange : 로그인 POST 요청 발생!");
       String result=null;
       
       
       System.out.println(usertype);
       MemberVO mvo = memberService.getOneInfo(usertype);
       memberService.changeUserType(mvo);
       
       result="success";
       
       return result;
    }
   	
}
