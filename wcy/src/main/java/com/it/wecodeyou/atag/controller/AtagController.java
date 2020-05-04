package com.it.wecodeyou.atag.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.it.wecodeyou.atag.service.IAtagService;

@RestController
@RequestMapping("/atag")
public class AtagController {
	
	@Autowired
	IAtagService service;
	
	
	
}
