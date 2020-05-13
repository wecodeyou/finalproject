package com.it.wecodeyou.on.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/on")
public class OnController {

	@GetMapping("/")
	public String sample(Model model) {
		
		
		return "/on/player";
	}

}