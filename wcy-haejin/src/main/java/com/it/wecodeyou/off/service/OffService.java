package com.it.wecodeyou.off.service;

import java.util.List;

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
	public Integer insert(ProductVO pvo, OffVO ovo) {
		
		Integer result = productDao.insertProduct(pvo);
		System.out.println("OffService register() - product Insert Result: " + result
				+ "\r\n productNo : " +pvo.getProductNo());
		if(result == 1) {
			ovo.setOffProductNo(pvo.getProductNo());
			result = offDao.insert(ovo);
			System.out.println("OffService register() - off_course Insert Result: " + result);
		} else {
			return 0;
		}
		
		return result;
	}

	@Override
	public List<OffVO> getInfoByAuthor(String offAuthor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OffVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(OffVO ovo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer offNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OffVO getOneInfo(Integer offNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OffVO getInfoByProductNo(Long productNo) {
		return offDao.getInfoByProductNo(productNo);
	}

}
