package com.it.wecodeyou.on.repository;

import com.it.wecodeyou.on.model.OnVO;
import com.it.wecodeyou.product.model.ProductVO;

public interface IOnMapper {

	public Integer insert(OnVO ovo);
	
	public OnVO getOne(Integer productNo);
	
	public String getAuthor(Integer productNo);

}
