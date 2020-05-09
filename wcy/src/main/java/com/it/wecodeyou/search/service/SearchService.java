package com.it.wecodeyou.search.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;
import com.it.wecodeyou.tag.repository.ITagMapper;

@Service
public class SearchService implements ISearchService{
	
	@Autowired 
	ITagMapper dao;

	@Override
	public ArrayList<ArticleVO> searchArticleByKeywordList(SearchVO svo) throws SQLException {
			return dao.searchArticleByKeywordList(svo);
	}

	@Override
	public ArrayList<ProductVO> searchAllProductByKeywordList(SearchVO svo) throws SQLException {
			return dao.searchAllProductByKeywordList(svo);
	}

	@Override
	public ArrayList<ProductVO> searchOnlineByKeywordList(SearchVO svo) throws SQLException {
			return dao.searchOnlineByKeywordList(svo);
	}

	@Override
	public ArrayList<ProductVO> searchOfflineByKeywordList(SearchVO svo) throws SQLException {
			return dao.searchOfflineByKeywordList(svo);
	}
	
	@Override
	public ArrayList<ProductVO> searchProductByKeywordList(SearchVO svo) throws SQLException {
			return dao.searchProductByKeywordList(svo);
	}


	@Override
	public ArrayList<ProductVO> productByKeywordList(SearchVO svo) throws SQLException {
			return dao.productByKeywordList(svo);
	}

}
