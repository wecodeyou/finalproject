package com.it.wecodeyou.sub_product.repository;

import java.util.ArrayList;

import com.it.wecodeyou.sub_product.model.SubProductVO;

public interface ISubProductMapper {

	public SubProductVO showSubPro(Integer spProId);
	
	public ArrayList<SubProductVO> showAllPro();
	
}
