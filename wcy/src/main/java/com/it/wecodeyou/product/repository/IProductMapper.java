package com.it.wecodeyou.product.repository;

import java.util.ArrayList;
import java.util.List;

import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;

public interface IProductMapper {

	public Integer insertProduct(ProductVO pvo);
	
	public void updateProduct(ProductVO pvo);
	
	public void deleteProduct(Long productNo);
	
	public List<ProductVO> list();
	
	public ProductVO getOneInfo(Integer productNo);

	public List<ProductVO> getProductByTitle(SearchVO svo);

	public Integer countProductsByTitle(SearchVO svo);

	public List<ProductVO> getProductByTitleContent(SearchVO svo);

	public Integer countProductsByTitleContent(SearchVO svo);

	public List<ProductVO> getProductListPaging(SearchVO svo);

	public Integer countProducts();

	public ProductVO getOneByName(String productName);
	
	public Integer getProductType(Integer productNo);
	//수강중인 온라인강의 출력
	public ArrayList<ProductVO> purchasedOn(Integer userNo);
}
