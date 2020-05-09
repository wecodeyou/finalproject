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
	public ArrayList<ArticleVO> searchArticleByKeyWord(SearchVO svo) throws SQLException {
		return dao.searchArticleByKeyWord(svo);
	}

	@Override
	public ArrayList<ArticleVO> searchAllArticleByKeyWord(SearchVO svo) throws SQLException {
		return dao.searchAllArticleByKeyWord(svo);
	}

	@Override
	public ArrayList<ProductVO> searchProductByKeyWord(SearchVO svo) throws SQLException {
		return dao.searchProductByKeyWord(svo);
	}

	@Override
	public ArrayList<ProductVO> searchAllProductByKeyWord(SearchVO svo) throws SQLException {
		return dao.searchAllProductByKeyWord(svo);
	}

	@Override
	public ArrayList<ArticleVO> searchArticleByKeywordList(SearchVO svo) throws SQLException {
		
		try {
			return dao.searchArticleByKeywordList(svo);
		} catch (Exception e) {
			System.out.println("dao exception Article");
		}
		return null;
	}

	@Override
	public ArrayList<ProductVO> searchProductByKeywordList(SearchVO svo) throws SQLException {
		
		try {
			return dao.searchProductByKeywordList(svo);
		} catch (Exception e) {
			System.out.println("dao exception : Product");
		}
		return null;
	}

}
