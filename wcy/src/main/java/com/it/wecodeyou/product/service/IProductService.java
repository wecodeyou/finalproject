package com.it.wecodeyou.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.it.wecodeyou.product.model.ProductVO;

@Service
public interface IProductService {
	
	public Integer register(ProductVO pvo);
	
	public void update(ProductVO pvo);
	
	public void remove(Long productNo);
	
	public List<ProductVO> list();
	
	public ProductVO getOneInfo(Integer productNo);
	
	public boolean insertPtag(ArrayList<Integer> sendTagList, Integer productNo); 
	
	
	//수강중인 강의 출력
	public ArrayList<ProductVO> purchasedOn(Integer userNo);
}
