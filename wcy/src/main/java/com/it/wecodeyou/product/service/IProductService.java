package com.it.wecodeyou.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;

@Service
public interface IProductService {
	
	public Integer register(ProductVO pvo);
	
	public void update(ProductVO pvo);
	
	public void remove(Long productNo);
	
	public List<ProductVO> list();
	
	public ProductVO getOneInfo(Integer productNo);
	
<<<<<<< HEAD
	public boolean insertPtag(ArrayList<Integer> sendTagList, Integer productNo);

	public List<ProductVO> Product(SearchVO svo);

	public List<ProductVO> getProductByTitle(SearchVO svo);

	public Integer countProductsByTitle(SearchVO svo);

	public List<ProductVO> getProductByTitleContent(SearchVO svo);

	public Integer countProductsByTitleContent(SearchVO svo);

	public List<ProductVO> getProductListPaging(SearchVO svo);

	public Integer countProducts(); 
	
=======
	public boolean insertPtag(ArrayList<Integer> sendTagList, Integer productNo); 
	
	
	//수강중인 강의 출력
	public ArrayList<ProductVO> purchasedOn(Integer userNo);
>>>>>>> refs/heads/asd
}
