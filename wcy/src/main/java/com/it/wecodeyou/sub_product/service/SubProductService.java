package com.it.wecodeyou.sub_product.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.sub_product.model.SubProductVO;
import com.it.wecodeyou.sub_product.repository.ISubProductMapper;

@Service
public class SubProductService implements ISubProductService{

	@Autowired
	private ISubProductMapper sdao;
	
	@Override
	public SubProductVO showSubPro(Integer spProId) {
		
		return sdao.showSubPro(spProId);
	}

	@Override
	public ArrayList<SubProductVO> showAllPro() {
		return sdao.showAllPro();
	}

}
