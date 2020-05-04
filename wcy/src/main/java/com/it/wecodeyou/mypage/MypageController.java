package com.it.wecodeyou.mypage;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.review.model.ReviewVO;
import com.it.wecodeyou.review.service.IReviewService;

@RestController
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private IMemberService mservice;
	@Autowired
	private IReviewService rservice;
	
	
	@GetMapping("/")
	public ModelAndView mypageMain(ModelAndView mv) {
		System.out.println("/mypage/ : GET 요청 발생!");
		mv.setViewName("mypage/mypage-main");
		return mv;
	}
	
	@GetMapping("/leclist")
	public ModelAndView lectureList(ModelAndView mv, ReviewVO rvo) {
		System.out.println("/mypage/leclist : GET 요청 발생!");
		mv.setViewName("mypage/mypage-lecList");
		mv.addObject(rvo);
		return mv;
	}

	@GetMapping("/myinfoChange")
	public ModelAndView myInfo(ModelAndView mv, HttpSession session) {
		System.out.println("/mypage/myinfoChange : GET 요청 발생!");
		mv.setViewName("mypage/mypage-change");
		//Timestamp t = new Timestamp(System.currentTimeMillis());
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		mv.addObject("user_birthday",sdf.format(mvo.getUserBirthday()));
		return mv;
	}

	@GetMapping("/pointInfo")
	public ModelAndView pointInfo(ModelAndView mv, HttpSession session) {
		System.out.println("/mypage/pointInfo : GET 요청 발생!");
		mv.setViewName("mypage/mypage-point");
		return mv;
	}

	@GetMapping("/recentAct")
	public ModelAndView recentAct(ModelAndView mv, HttpSession session) {
		System.out.println("/mypage/recentAct : GET 요청 발생!");
		mv.setViewName("mypage/mypage-recentAct");
		return mv;
	}

}
