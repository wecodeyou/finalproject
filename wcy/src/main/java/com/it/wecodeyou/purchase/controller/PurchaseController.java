package com.it.wecodeyou.purchase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.off.model.SeatVO;
import com.it.wecodeyou.off.service.ISeatService;
import com.it.wecodeyou.purchase.model.PurchaseVO;
import com.it.wecodeyou.purchase.service.IPurchaseService;

@RestController
@RequestMapping(value="/purchase")
public class PurchaseController {

	@Autowired
	IMemberService mservice;
	
	@Autowired
	IPurchaseService pservice;
	
	@Autowired
	ISeatService sservice;
	
	@PostMapping(value="/purchase")
	public ModelAndView purchaseProduct(HttpSession session, HttpServletRequest req, ModelAndView mv){
		Integer proNo = Integer.parseInt(req.getParameter("pro_no"));
		Integer proPrice = Integer.parseInt(req.getParameter("pro_price"));
		Integer proType = Integer.parseInt(req.getParameter("pro_type"));
		Integer seatNo = Integer.parseInt(req.getParameter("seat_no"));
		Integer buyer_no = ((MemberVO)session.getAttribute("login")).getUserNo();
		PurchaseVO pv = new PurchaseVO();
		pv.setPurchaseProNo(proNo);
		pv.setPurchaseBuyer(buyer_no);
		pv.setPurchaseAmount(proPrice);
		if(proType == 1) {// 오프라인 강의 일경우 
			pv.setPurchaseSeatNo(seatNo);
			// 자리도 설정
			
			// 여기부터는 seat table - insert
			SeatVO sv = new SeatVO();
			sv.setSeatOffNo(proNo);
			sv.setSeatUserNo(buyer_no);
			sv.setSeatIndex(seatNo);
			pservice.insertOffPro(pv);
		}else {			
			pservice.insertOnPro(pv);
		}
		// 이제 member table point update
		
		
		mv.setViewName("home");
		
		return mv;	
	}
	
	
}
