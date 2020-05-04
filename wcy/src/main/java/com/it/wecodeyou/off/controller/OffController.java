package com.it.wecodeyou.off.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.off.model.SeatVO;
import com.it.wecodeyou.off.service.IOffService;
import com.it.wecodeyou.off.service.ISeatService;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;

@RestController
@RequestMapping("/off")
public class OffController {
   
   @Autowired
   private ISeatService service;

   @Autowired
   IProductService productService;
   
   @Autowired
   IOffService offService;
   
   //강의실 체크 페이지 요청
   @GetMapping("/seat_main")
   public ModelAndView selectSeat(ModelAndView mv) {
      
      mv.setViewName("off/seat_main");
      return mv;
      
   }
   //강의실 페이지 요청
   @GetMapping("/seat")
   public ModelAndView viewSeat(ModelAndView mv, HttpServletRequest req) {
      
      mv.setViewName("off/seat");
      mv.addObject("seat", req.getParameter("seat"));
      return mv;
      
   }
   @GetMapping(value="/register")
   public ModelAndView register(ModelAndView mv) {
	   mv.setViewName("/off/OffForm");
	   return mv;
   }
   
   //오프라인강의랑 상품 정보를 다 가져오기 위해 만든 커스텀 VO로 한번에 가져옴
   @PostMapping(value="/register")
   public String register(@RequestBody OffProductVO opvo) {
         System.out.println("/register - param received \n\r " + opvo.toString());
         String result = null;
         
         ProductVO pvo = new ProductVO();
         pvo.setProductName(opvo.getProductName());
         pvo.setProductPrice(opvo.getProductPrice());
         pvo.setProductType(opvo.getProductType());
         pvo.setProductThumb(opvo.getProductThumb());
         pvo.setProductDetail(opvo.getProductDetail());
         
         OffVO ovo = new OffVO();
         ovo.setOffAuthor(opvo.getOffAuthor());
         ovo.setOffCategory(opvo.getOffCategory());
         ovo.setOffPlace(opvo.getOffPlace());
         ovo.setOffSeats(opvo.getOffSeats());
         ovo.setOffStartAt(opvo.getOffStartAt());
         ovo.setOffEndAt(opvo.getOffEndAt());
         
         //tag number list
         ArrayList<Integer> sendTagList = opvo.getSendTagList();
         
        if( offService.insert(pvo, ovo, sendTagList) == 1){
        	result =  "off_success";
        } else {
        	result = "off_fail";
        }
         
         return result;
      }
   
  @GetMapping("/{productNo}")
  public ModelAndView info(@PathVariable Integer productNo, ModelAndView mv) {
	  
	  ProductVO pvo = productService.getOneInfo(productNo);
	  OffVO ovo = offService.getInfoByProductNo(productNo);
	  System.out.println("/off/{productNo} ProductVO : \r\n" + pvo.toString());
	  System.out.println("/off/{productNo} OffVO : \r\n" + ovo.toString());
	  	mv.addObject("product", pvo);
	  	mv.addObject("off", ovo);
	  	mv.setViewName("/off/detail");
	  return mv;
  }
   
   @GetMapping("/test")
   public ModelAndView test(ModelAndView mv, HttpServletRequest req) {
      if(req.getParameter("seat") != null) {
         service.bookedList2(Integer.parseInt(req.getParameter("seat")));
      }
      mv.setViewName("off/test");
      mv.addObject("data",req.getParameter("seat"));
      
      return mv;
      
   }
   
   @PostMapping("/chooseSeat")
   public ModelAndView chooseSeat(SeatVO sv, ModelAndView mv, HttpServletRequest req, HttpSession session) {
      // 좌석 value가 넘어옴 ex) 12 => 첫번째줄 두번째 자리
      req.getParameter("Chk_name");      
      sv.setSeatUserNo(((MemberVO)session.getAttribute("login")).getUserNo());
      sv.setSeatOffNo(Integer.parseInt(req.getParameter("off")));
      sv.setSeatIndex(Integer.parseInt(req.getParameter("Chk_name")));
      service.insertSeat2(sv);
      mv.setViewName("off/result");
      
      return mv;
   }
   
   @PostMapping("/selectChecked")
   public Map<String, ArrayList<Integer>> bookedList(@RequestBody Integer seat_off_no) {
      
      Map<String, ArrayList<Integer>> retVal = new HashMap<String, ArrayList<Integer>>();
      ArrayList<Integer> booked_list = service.bookedList(seat_off_no);
      retVal.put("list", service.bookedList(seat_off_no)); //list란 키로 bookedList의 값을 넣어줍니다.

      if(booked_list==null) {
         System.out.println("비어있음");
      }else {
         System.out.println("정보있음" ); 
         for (Integer integer : booked_list) {
			System.out.println(integer);
		}
      }
      return retVal;  
           
   }
   
   
   
}