package com.it.wecodeyou.search.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;

public interface ISearchService {
	
	//product keywordList로 검색(paging처리 O)
    public ArrayList<ProductVO> searchAllProductByKeywordList(SearchVO svo) throws SQLException;
    
    //productType과 검색어로 검색
    public ArrayList<ProductVO> productByKeywordList(SearchVO svo) throws SQLException;

    //페이징을 위한 상품 개수
	public Integer countProductsByKeywordList(SearchVO svo);


}

