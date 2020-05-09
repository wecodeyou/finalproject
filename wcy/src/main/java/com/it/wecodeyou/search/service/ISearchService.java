package com.it.wecodeyou.search.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;

public interface ISearchService {
	
	/*
	 * //세부 검색(paging처리 O) 검색어로 게시글 제목, 내용 검색 public ArrayList<ArticleVO>
	 * searchArticleByKeyWord(SearchVO svo) throws SQLException;
	 * 
	 * //메인 검색(paging처리 X) 검색어로 게시글 제목, 내용 검색 public ArrayList<ArticleVO>
	 * searchAllArticleByKeyWord(SearchVO svo) throws SQLException;
	 * 
	 * //product 세부 검색(paging처리 O) 검색어로 name, detail 검색 public ArrayList<ProductVO>
	 * searchProductByKeyWord(SearchVO svo) throws SQLException;
	 * 
	 * //article 메인 검색(paging처리 X) 검색어로 name, detail 검색 public ArrayList<ProductVO>
	 * searchAllProductByKeyWord(SearchVO svo) throws SQLException;
	 * 
	 */
	//keywordList로 검색(paging처리 X) 
	public ArrayList<ArticleVO> searchArticleByKeywordList(SearchVO svo) throws SQLException;
   
	//product keywordList로 검색(paging처리 O)
    public ArrayList<ProductVO> searchAllProductByKeywordList(SearchVO svo) throws SQLException;
    
    //product - online keywordList로 검색(paging처리 O)
    public ArrayList<ProductVO> searchOnlineByKeywordList(SearchVO svo) throws SQLException;
    
    //product - offline keywordList로 검색(paging처리 O)
    public ArrayList<ProductVO> searchOfflineByKeywordList(SearchVO svo) throws SQLException;
    
    //product keywordList로 검색(paging처리 O)
    public ArrayList<ProductVO> searchProductByKeywordList(SearchVO svo) throws SQLException;
    
  //test productType
    public ArrayList<ProductVO> productByKeywordList(SearchVO svo) throws SQLException;
}

