package com.it.wecodeyou.off_session.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.member.model.MemberVO;
import com.it.wecodeyou.member.service.IMemberService;
import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.off.service.IOffService;
import com.it.wecodeyou.off_session.model.LectureRoom;
import com.it.wecodeyou.off_session.repository.LectureRoomRepository;
import com.it.wecodeyou.purchase.model.PurchaseVO;
import com.it.wecodeyou.purchase.service.IPurchaseService;


@RestController
@RequestMapping("/session")
public class SessionController {
	private final LectureRoomRepository repository = new LectureRoomRepository();
	
	@Autowired
	IOffService offService;
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IPurchaseService purchaseService;
	@GetMapping("/instructor/myclass")
	public ModelAndView instructorCheck(ModelAndView mv, HttpSession session) {
		System.out.println("GET /instructor/myclass");
		MemberVO mvo = null;
		try {
			mvo = (MemberVO) session.getAttribute("login");
		} catch(NullPointerException e) {
			mv.addObject("message", "로그인해주시기 바랍니다");
			mv.setViewName("redirect:/");
			return mv;
		}
		List<OffProductVO> myClass = offService.getOffProductByAuthor(mvo.getUserEmail());
		mv.addObject("myClass", myClass);
		mv.setViewName("off/authorSelection");
		return mv;
	}

	@GetMapping("/instructor/lecture/{productNo}")
	public ModelAndView instructorEnter(ModelAndView mv, @PathVariable Integer productNo, HttpSession session) {
		System.out.println("GET /instructor/lecture/{product}");
		OffVO ovo = offService.getInfoByProductNo(productNo);
		OffProductVO opvo = offService.getOffProduct(ovo.getOffProductNo());
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		System.out.println("opvo : " + opvo.toString());
		repository.create(opvo, mvo);
		mv.addObject("roomInfo", repository.findLecture("" + opvo.getProductNo()));
		mv.setViewName("/off/OffLectureMaster");
		return mv;
	}
	
	@GetMapping("/participant/myoff")
	public ModelAndView participantSelect(ModelAndView mv, HttpSession session) {
		MemberVO mvo = null;
		try {
			mvo = (MemberVO) session.getAttribute("login");
		} catch(NullPointerException e) {
			mv.addObject("message", "로그인해주시기 바랍니다");
			mv.setViewName("redirect:/");
			return mv;
		}
		List<PurchaseVO> myLecture = purchaseService.selectUsersPurchase(mvo.getUserNo());
		List<LectureRoom> activeList = repository.getActiveSession(myLecture);
		mv.addObject("activeList", activeList);
		mv.setViewName("off/lectureSelection");
		return mv;
	}
	
	@GetMapping("/participant/join/{productNo}")
	public ModelAndView participantJoin(ModelAndView mv, HttpSession session, @PathVariable Integer productNo) {
		MemberVO mvo = (MemberVO) session.getAttribute("login");
		LectureRoom room = repository.getlectureRoom(String.valueOf(productNo));
		room.join(mvo);
		mv.addObject("roomInfo", room);
		mv.setViewName("off/OffLectureAttendant");
		return mv;
	}
}
