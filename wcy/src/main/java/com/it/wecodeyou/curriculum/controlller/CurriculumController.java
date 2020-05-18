package com.it.wecodeyou.curriculum.controlller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.curriculum.model.CurriculumVO;
import com.it.wecodeyou.curriculum.service.ICurriculumService;
import com.it.wecodeyou.episode.service.IEpisodeService;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;
import com.it.wecodeyou.review.model.ReviewVO;
import com.it.wecodeyou.review.service.ReviewService;
import com.it.wecodeyou.sub_product.service.SubProductService;

@RestController
@RequestMapping("/curriculum")
public class CurriculumController {

   @Autowired
   private ICurriculumService service;
      
   @Autowired
   private IProductService pservice;
   
   @Autowired
   private IEpisodeService eservice;

   @Autowired
   private ReviewService rservice;
   
   @Autowired
   private SubProductService spservice;
   
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
	@GetMapping("/sub")
	public ModelAndView curriculumSub(ModelAndView mv, HttpServletRequest req) throws SQLException {
		ProductVO pvo = pservice.getOneByName(req.getParameter("s"));
		
		ArrayList<ReviewVO> r_list = rservice.getAllReviewByLec(pvo.getProductNo());
	    int sum = 0;
		for (int i = 0; i < r_list.size(); i++) {
			sum += r_list.get(i).getReviewStar();
		}
		float avg = 0;
		if(r_list.size() != 0) {
			avg = sum/r_list.size(); 
		}
		
		
		
		
		mv.addObject("sub_pro", spservice.showSubPro(pvo.getProductNo()));
		mv.addObject("s", req.getParameter("s"));
		mv.addObject("pro",pvo);
		mv.addObject("review_num",r_list.size());	// 수강후기 갯수
		mv.addObject("avg",avg);	// 별점 평균
		mv.addObject("review",r_list);
		System.out.println(pvo.getProductNo());
		if(pvo.getProductType().equals("1")) {
			mv.setViewName("curriculum/offDetail");
			System.out.println("현장강의 선택");
		}else {
			
			//에피소드 리스트 
			mv.addObject("episodeList",eservice.getAllEpisode1(pservice.getOneByName(req.getParameter("s")).getProductNo()));
			System.out.println(eservice.getAllEpisode1(pservice.getOneByName(req.getParameter("s")).getProductNo()));
			mv.setViewName("curriculum/onDetail");
			System.out.println("온라인 선택");
		}
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




