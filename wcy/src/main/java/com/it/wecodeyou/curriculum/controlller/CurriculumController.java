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
 
	//커리큘럼소개 main 요청 (==> 온라인, 오프라인 통합 main임. 맵핑 주소 이름 변경 요망)
	@GetMapping("/on_main")
	public ModelAndView curriculumOnMain(ModelAndView mv, HttpServletRequest req) {
	
	System.out.println("서비스 전 컨트롤러"+req.getParameter("seq"));
	mv.setViewName("curriculum/onMain");
	CurriculumVO cvo = service.showCurriculum(Integer.parseInt(req.getParameter("seq")));
	mv.addObject("c", cvo);
	System.out.println("서비스 후 컨트롤러"+cvo);
	return mv;
	      
	}

	
	//커리큘럼소개 sub 요청 (==> 온라인 detatil page, 오프라인 detatil 페이지 구분. 맵핑 요망)
	@GetMapping("/curriculum/sub")
	public ModelAndView curriculumSub(ModelAndView mv, HttpServletRequest req) {
		
		mv.setViewName("curriculum/sub");
		mv.addObject("seq", req.getParameter("seq"));
		return mv;
		
	}
	
	//online detail 페이지 임시 겟 맵핑 
	@GetMapping("/on_detail")
	public ModelAndView on_detatil() {
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("curriculum/onDetail");
	    return mv;
	}
   
	//online detail 페이지 임시 겟 맵핑 
	@GetMapping("/off_detail")
	public ModelAndView odd_detatil() {
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("curriculum/offDetail");
	    return mv;
	}
   
}




