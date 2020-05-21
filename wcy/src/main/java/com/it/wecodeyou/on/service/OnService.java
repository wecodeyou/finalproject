package com.it.wecodeyou.on.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.on.model.OnVO;
import com.it.wecodeyou.on.repository.IOnMapper;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.repository.IProductMapper;
import com.it.wecodeyou.ptag.repository.IPtagMapper;
import com.it.wecodeyou.purchase.model.PurchaseVO;

@Service
public class OnService implements IOnService {

	
	@Autowired
	private IProductMapper productDao;
	@Autowired
	private IOnMapper onDao;
	@Autowired
	private IPtagMapper ptagDao;
	


	@Override
	public Integer insert(ProductVO pvo, OnVO ovo, ArrayList<Integer> sendTagList) {
		// TODO Auto-generated method stub
		
		Integer result = productDao.insertProduct(pvo);
		System.out.println("OnService register() - product Insert Result: " + result
				+ "\r\n productNo : " +pvo.getProductNo());
		
		if(result == 1) {
			//insert into product_tag table
			for (int i = 0; i < sendTagList.size(); i++) {
				try {
					ptagDao.insertPtag(sendTagList.get(i), pvo.getProductNo());
				} catch (SQLException e) {
					System.out.println("dao insertPtag Exeption!: " + sendTagList.get(i));
					e.printStackTrace();
				}
			}
			
			//insert into off_course table
			ovo.setOnProductNo(pvo.getProductNo());
			result = onDao.insert(ovo);
			System.out.println("OnService register() - on_course Insert Result: " + result);
			return pvo.getProductNo();
		} else {
			return 0;
		}
	}



	@Override
	public OnVO getOne(Integer productNo) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public String getAuthor(Integer productNo){	
		// TODO Auto-generated method stub
		return onDao.getAuthor(productNo);
	}



	@Override
	public Integer getDays(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return onDao.getDays(pvo);
	}

	
}
