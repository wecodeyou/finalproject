package com.it.wecodeyou.on.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.it.wecodeyou.on.model.OnVO;
import com.it.wecodeyou.on.repository.IOnMapper;

public class OnService implements IOnService {

	
	@Autowired
	IOnMapper dao;
	
	@Override
	public Integer InsertOn(OnVO ovo) {
		// TODO Auto-generated method stub
		return dao.InsertOn(ovo);
	}

	
}
