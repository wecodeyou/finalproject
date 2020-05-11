package com.it.wecodeyou.curriculum.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.curriculum.model.CurriculumVO;
import com.it.wecodeyou.curriculum.repository.ICurriculumMapper;

@Service
public class CurriculumService implements ICurriculumService{

	
	@Autowired
	private ICurriculumMapper dao;
	
	@Override
	public CurriculumVO showCurriculum(Integer seq){
		System.out.println("서비스에서 찍음"+seq);
		return dao.showCurriculum(seq);
	}
}
