package com.it.wecodeyou.episode.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.it.wecodeyou.episode.service.IEpisodeService;

@RestController
@RequestMapping("/episode")
public class EpisodeController {

	
	@Autowired
	IEpisodeService service;
	
	@GetMapping("/")
	public ModelAndView main() throws SQLException {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("episodeList",service.getAllEpisode());
		mv.setViewName("episode/main-form");
		return mv;
	}
	
	@GetMapping("/play")
	public ModelAndView play(HttpServletRequest req) throws SQLException {
		ModelAndView mv = new ModelAndView();
		
		String videosrc = req.getParameter("episodeSource");
		System.out.println(videosrc);
		mv.addObject("videosrc",videosrc);
		mv.addObject("episodeList",service.getAllEpisode());
		mv.setViewName("on/player");
		return mv;
	}
}
