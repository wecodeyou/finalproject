package com.it.wecodeyou.on.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.episode.model.EpisodeVO;
import com.it.wecodeyou.episode.service.IEpisodeService;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.service.IProductService;

@Controller
@RequestMapping("/on")
public class OnController {

	@Autowired
	IProductService productService;
	
	@Autowired
	IEpisodeService episodeService;
	
	@GetMapping("/")
	public ModelAndView onList(ModelAndView mv) {
		
		
		List<ProductVO> pList = productService.list();

		mv.addObject("productList", pList);
		mv.setViewName("on/onList");
		return mv;
	}
	
	@GetMapping("/{productNo}")
	public ModelAndView info(@PathVariable Integer productNo, ModelAndView mv) {

		ProductVO pvo = productService.getOneInfo(productNo);
		System.out.println("/on/{productNo} ProductVO : \r\n" + pvo.toString());
		mv.addObject("product", pvo);
		mv.setViewName("/on/addepisode");
		return mv;
	}
	
	@GetMapping("/register")
	public ModelAndView register(ModelAndView mv){
		mv.setViewName("/on/register");
		return mv;
	}
	
	@PostMapping("/addepisode")
	public ModelAndView addEpisode(HttpServletRequest req, ModelAndView mv) throws SQLException {
		
		String episodeName[] = req.getParameterValues("episodeName");
		String episodeSource[] = req.getParameterValues("episodeSource");
		Integer productNo = Integer.parseInt(req.getParameter("productNo"));
		Integer episodeOnNo = episodeService.getOnNo(productNo);
		System.out.println(episodeOnNo);
		
		for (int i = 1; i <= episodeName.length; i++) {
		
			EpisodeVO evo = new EpisodeVO();
			
			evo.setEpisodeOnNo(episodeOnNo);
			evo.setEpisodeRowNo(i);
			evo.setEpisodeName(episodeName[i-1]);
			evo.setEpisodeSource(episodeSource[i-1]);
			
			
			episodeService.insertEpisode(evo);
		}
		
		mv.setViewName("on/onList");
		
		return mv;
		
	}
	
	@GetMapping("/addon")
	public String addOn() {
		
		return "on/addoncourse";
	}
	
	
	
}