package com.it.wecodeyou.off.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.product.model.ProductVO;

public class OffService implements IOffService {

	
	@Autowired
	private IOffService offService;
	
	@Override
	public boolean register(ProductVO pvo, OffVO ovo) {
		
		return false;
	}

}
