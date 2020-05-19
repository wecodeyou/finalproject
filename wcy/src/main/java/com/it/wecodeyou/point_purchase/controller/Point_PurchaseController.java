package com.it.wecodeyou.point_purchase.controller;

import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.point_purchase.model.Point_PurchaseVO;
import com.it.wecodeyou.point_purchase.service.IPoint_PurchaseService;

@Controller
@RequestMapping("/pay")
public class Point_PurchaseController {

	
	@Autowired
	IMemberService mservice;
	@Autowired
	IPoint_PurchaseService pservice;
	
	@GetMapping("/pay")
	public String pay(Model model) throws SQLException {
		
		
		
		
		return "pay/paymain";
	}
	@GetMapping("/")
	public ModelAndView pay(ModelAndView mv) throws SQLException {
		
		mv.setViewName("point_purchase/point_purchase-main");
			
		return mv;
	}
	
	@PostMapping("/gopay")
	public ModelAndView gopay(ModelAndView mv, HttpServletRequest request) throws SQLException {
		
		int point = 0;

		if (request.getParameter("point").equals("")) {		
			point = Integer.parseInt(request.getParameter("radiop"));
			System.out.println("radio 선택");
			
		} else 
			point = Integer.parseInt(request.getParameter("point"));
		
			
		mv.addObject("point",point);	//포인트
		mv.addObject("amount",point);	//금액
		
		mv.setViewName("point_purchase/inicis");
		
		
		return mv;
	}
	

	@PostMapping("/paying")
	public void paying(Model model, HttpServletRequest req,HttpSession session) throws SQLException {
		
		String id = req.getParameter("imp_uid");
		Integer amount = Integer.parseInt(req.getParameter("amount"));
		Point_PurchaseVO pvo = new Point_PurchaseVO(0,((MemberVO)session.getAttribute("login")).getUserNo(),id,new Timestamp(0),amount);

		
		pservice.insertPointPurchase(pvo);
		pservice.addPoint(pvo);
		
		//req.getSession().setAttribute("recent",pservice.getOneRecent(((MemberVO)session.getAttribute("login")).getUserNo()));
				
	}
	
	@GetMapping("/paycomplete")
	public ModelAndView paycom(ModelAndView mv, HttpSession session ) throws SQLException {
		
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		System.out.println("userno : " + mvo.getUserNo());
		mv.addObject("recent",pservice.getOneRecent(((MemberVO)session.getAttribute("login")).getUserNo()));
		mv.setViewName("point_purchase/result");
		return mv;
	}
	
	@GetMapping("/fail")
	public String payfail(Model model) throws SQLException {
		
		
		System.out.println("결제 실패");
		
		return "point_purchase/point_purchase-main";
	}	
	
	
}
