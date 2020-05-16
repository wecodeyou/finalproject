package com.it.wecodeyou.on.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.it.wecodeyou.off.repository.IOffMapper;
import com.it.wecodeyou.on.model.OnVO;
import com.it.wecodeyou.on.repository.IOnMapper;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.repository.IProductMapper;
import com.it.wecodeyou.ptag.repository.IPtagMapper;

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
			System.out.println("OffService register() - off_course Insert Result: " + result);
		} else {
			return 0;
		}
		
		return result;
	}

	
}
