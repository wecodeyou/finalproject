package com.it.wecodeyou.on.repository;

import com.it.wecodeyou.on.model.OnVO;
import com.it.wecodeyou.purchase.model.PurchaseVO;

public interface IOnMapper {

	public Integer insert(OnVO ovo);
	
	public OnVO getOne(Integer productNo);
	
	public String getAuthor(Integer productNo);

	public Integer getDays(PurchaseVO pvo);
	
}
