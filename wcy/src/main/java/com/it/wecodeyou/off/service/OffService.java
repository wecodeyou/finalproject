package com.it.wecodeyou.off.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.off.repository.IOffMapper;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.repository.IProductMapper;

@Service
public class OffService implements IOffService {

	
	@Autowired
	private IProductMapper productDao;
	@Autowired
	private IOffMapper offDao;
	
	@Override
	public boolean register(ProductVO pvo, OffVO ovo) {
		
		Integer productNo = productDao.insertProduct(pvo);
		System.out.println("OffService register() - productNo: " + productNo);
		
		ovo.setOffProductNo(productNo);
		return true;
	}

}
