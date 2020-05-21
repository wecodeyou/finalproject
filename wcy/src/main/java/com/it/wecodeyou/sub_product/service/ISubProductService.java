package com.it.wecodeyou.sub_product.service;

import java.util.ArrayList;

import com.it.wecodeyou.sub_product.model.SubProductVO;

public interface ISubProductService {

	public SubProductVO showSubPro(Integer spProId);
	
	public ArrayList<SubProductVO> showAllPro();
	
	public Integer insert(SubProductVO spvo);
}
