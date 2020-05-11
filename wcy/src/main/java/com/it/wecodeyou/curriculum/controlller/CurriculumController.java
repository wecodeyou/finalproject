package com.it.wecodeyou.curriculum.controlller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.curriculum.model.CurriculumVO;
import com.it.wecodeyou.curriculum.service.ICurriculumService;

@RestController
@RequestMapping("/curriculum")
public class CurriculumController {

   @Autowired
   private ICurriculumService service;
 
	//커리큘럼소개 main 요청
	@GetMapping("/on_main")
	public ModelAndView curriculumOnMain(ModelAndView mv, HttpServletRequest req) {
	
	System.out.println("서비스 전 컨트롤러"+req.getParameter("seq"));
	mv.setViewName("curriculum/onMain");
	CurriculumVO cvo = service.showCurriculum(Integer.parseInt(req.getParameter("seq")));
	mv.addObject("c", cvo);
	System.out.println("서비스 후 컨트롤러"+cvo);
	return mv;
	      
	}

	//커리큘럼소개 main 요청
	@GetMapping("/curriculum/off_main")
	public ModelAndView curriculumOffMain(ModelAndView mv, HttpServletRequest req) {
		
		mv.setViewName("curriculum/offMain");
		mv.addObject("seq", req.getParameter("seq"));
		return mv;
		
	}
	
	//커리큘럼소개 sub 요청
	@GetMapping("/curriculum/sub")
	public ModelAndView curriculumSub(ModelAndView mv, HttpServletRequest req) {
		
		mv.setViewName("curriculum/sub");
		mv.addObject("seq", req.getParameter("seq"));
		return mv;
		
	}
   
   
}