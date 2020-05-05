package com.it.wecodeyou.tag.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.tag.repository.ITagMapper;

@Service
public class TagService implements ITagService{

	@Autowired
	ITagMapper dao;
	
	@Override
	public ArrayList<TagVO> getAllTag()  throws SQLException {
		return dao.getAllTag();
	}
	
	@Override
	public String getTagName(Integer tagNo) throws SQLException {
		return dao.getTagName(tagNo);
	}

	@Override
	public Integer checkTag(String tagName)  throws SQLException {
		return dao.checkTag(tagName);
	}
	
	@Override
	public ArrayList<TagVO> checkTagDetail(String q) throws SQLException {
		return dao.checkTagDetail(q);
	}

	@Override
	public boolean insertTag(String tag)  throws SQLException {
		
		try {
			dao.insertTag(tag);
		} catch (Exception e) {
			System.out.println("dao insertTag Exeption!: " + tag);
			return false;
		}
		return true;
	}

	@Override
	public ArrayList<ProductVO> searchProductByTag(String tagName) throws SQLException {
		return  dao.searchProductByTag(tagName);
	}

	@Override
	public ArrayList<ArticleVO> searchArticleByTag(String tagName) throws SQLException {
		return dao.searchArticleByTag(tagName);
	}

	@Override
	public ArrayList<TagVO> searchPTag() throws SQLException {
		return dao.searchPTag();
	}

	@Override
	public ArrayList<TagVO> searchATag() throws SQLException {
		return dao.searchATag();
	}

	@Override
	public ArrayList<TagVO> searchAPTag() throws SQLException {
		return dao.searchAPTag();
	}

	@Override
	public ArrayList<String> searchTagByArticle(Integer articleNo) throws SQLException {
		return dao.searchTagByArticle(articleNo);
	}

	@Override
	public ArrayList<TagVO> searchTagByProduct(Integer productNo) throws SQLException {
		return dao.searchTagByProduct(productNo);
	}



	

}
