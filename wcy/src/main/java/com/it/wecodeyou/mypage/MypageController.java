package com.it.wecodeyou.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// 이게 왜 안쓰이는 거지 ?
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.product.service.IProductService;
import com.it.wecodeyou.purchase.model.PurchaseVO;
import com.it.wecodeyou.purchase.service.IPurchaseService;
import com.it.wecodeyou.review.model.ReviewVO;
import com.it.wecodeyou.review.service.IReviewService;

@RestController
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private IMemberService mservice;
	@Autowired
	private IReviewService rservice;
	@Autowired
	private IProductService pdservice;
	@Autowired
	private IPurchaseService pservice;

	@GetMapping("/leclist")
	public ModelAndView lectureList(ModelAndView mv, ReviewVO rvo, HttpSession session) {

		System.out.println("/mypage/leclist : GET 요청 발생!");

		mv.addObject("lec_list", pdservice.purchasedOn(((MemberVO) session.getAttribute("login")).getUserNo()));
		mv.setViewName("mypage/mypage-lecList");
		ArrayList<PurchaseVO> pv_list = new ArrayList<PurchaseVO>();
		pv_list = pservice.selectUsersPurchase(((MemberVO) session.getAttribute("login")).getUserNo());
		mv.addObject("pv_list", pv_list);
		// mv.addObject(rvo);
		return mv;
	}

	@GetMapping("/myinfoChange")
	public ModelAndView myInfo(ModelAndView mv, HttpServletResponse res ,HttpSession session, HttpServletRequest req) throws IOException {
		System.out.println("/mypage/myinfoChange : GET 요청 발생!");
		if(session.getAttribute("login") == null) {
			 mv.setViewName("home");
	         res.setContentType("text/html; charset=UTF-8");
			 PrintWriter out_email = res.getWriter();
	         out_email.println("<script>alert('장기간 미활동으로 로그아웃되었습니다. 다시 로그인 해주세요.');</script>");
	         out_email.flush();
	         
		}else {
			mv.setViewName("mypage/mypage-change");			
			// Timestamp t = new Timestamp(System.currentTimeMillis());
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			MemberVO mvo = (MemberVO) session.getAttribute("login");
			if(mvo.getUserBirthday() != null) {
				mv.addObject("user_birthday", sdf.format(mvo.getUserBirthday()));
			}
			/*
			 * if (req.getParameter("change") != null) { mv.addObject("change",
			 * req.getParameter("change")); System.out.println(req.getParameter("change"));
			 * }
			 */
		}
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

	// 비밀번호 변경 시 비밀번호 맞는지 확인
	@PostMapping("/pwCheck")
	public String loginCheck(@RequestBody String userPw, HttpSession session) throws SQLException {
		System.out.println("/mypage/pwCheck : 비밀번호 확인 POST 요청 발생!");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); // 비밀번호 암호화 하여 db 저장하기 위한 객체 선언

		if (encoder.matches(userPw, ((MemberVO) session.getAttribute("login")).getUserPw())) {
			return "OK";			
		} else {
			return "NO";			
		}
	}

	@GetMapping("/mylec")
	public ModelAndView mylec(ModelAndView mv, HttpSession session) {
		System.out.println("/mypage/mylec : GET 요청 발생!");
		mv.setViewName("mypage/mypage-mylec");
		
		//구매내역에 있는 온라인 강의 출력
		mv.addObject("lec_list",pdservice.purchasedOn(((MemberVO)session.getAttribute("login")).getUserNo()));

		
		return mv;
	}
	
	
}
