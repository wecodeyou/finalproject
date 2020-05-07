package com.it.wecodeyou.product.repository;

import java.util.ArrayList;
import java.util.List;

import com.it.wecodeyou.product.model.ProductVO;

public interface IProductMapper {

	public Integer insertProduct(ProductVO pvo);
	
	public void updateProduct(ProductVO pvo);
	
	public void deleteProduct(Long productNo);
	
	public List<ProductVO> list();
	
	public ProductVO getOneInfo(Integer productNo);

	//수강중인 온라인강의 출력
	public ArrayList<ProductVO> purchasedOn(Integer userNo);
}
