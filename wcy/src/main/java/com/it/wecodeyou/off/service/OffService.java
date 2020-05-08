package com.it.wecodeyou.off.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.off.model.OffProductVO;
import com.it.wecodeyou.off.model.OffVO;
import com.it.wecodeyou.off.repository.IOffMapper;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.product.repository.IProductMapper;
import com.it.wecodeyou.ptag.repository.IPtagMapper;

@Service
public class OffService implements IOffService {

	
	@Autowired
	private IProductMapper productDao;
	@Autowired
	private IOffMapper offDao;
	@Autowired
	private IPtagMapper ptagDao;
	
	@Override
	public Integer insert(ProductVO pvo, OffVO ovo, ArrayList<Integer> sendTagList) {
		
		//insert into product table
		Integer result = productDao.insertProduct(pvo);
		System.out.println("OffService register() - product Insert Result: " + result
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
		return offDao.getInfoByAuthor(offAuthor);
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
	public OffVO getInfoByProductNo(Integer productNo) {
		return offDao.getInfoByProductNo(productNo);
	}

	@Override
	public OffProductVO getOffProduct(Integer productNo) {
		return offDao.getOffProduct(productNo);
	}

}
