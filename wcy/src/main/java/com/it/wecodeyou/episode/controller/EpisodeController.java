package com.it.wecodeyou.episode.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.episode.model.EpisodeVO;
import com.it.wecodeyou.episode.service.IEpisodeService;

@RestController
@RequestMapping("/episode")
public class EpisodeController {

	
	@Autowired
	IEpisodeService service;
	
	@GetMapping("/")
	public ModelAndView main(HttpServletRequest req) throws SQLException {
		ModelAndView mv = new ModelAndView();
		
		Integer productNo = Integer.parseInt(req.getParameter("productNo"));
		mv.addObject("episodeList",service.getAllEpisode1(productNo));
		mv.setViewName("episode/main-form");
		return mv;
	}
	
	@GetMapping("/play")
	public ModelAndView play(HttpServletRequest req) throws SQLException {
		ModelAndView mv = new ModelAndView();
		
		Integer episodeRowNo = Integer.parseInt(req.getParameter("episodeRowNo"));
		String episodeSource = req.getParameter("episodeSource");
		System.out.println(episodeSource);
		/*
		 * System.out.println(videosrc); mv.addObject("videosrc",videosrc);
		 */
		
		mv.addObject("select",episodeRowNo);
//		mv.addObject("episodeList",service.getAllEpisode(evo.getEpisodeRowNo()));
		mv.addObject("episodeList",service.getAllEpisode2(episodeSource));
		mv.setViewName("on/player");
		return mv;
	}
}
