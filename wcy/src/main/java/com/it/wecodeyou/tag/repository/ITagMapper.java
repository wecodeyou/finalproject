package com.it.wecodeyou.tag.repository;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.tag.model.TagVO;

public interface ITagMapper {
	
	//select all
	public ArrayList<TagVO> getAllTag() throws SQLException;
	
	//search tagname by tagno
	public String getTagName(Integer tagNo) throws SQLException;
	
	//check duplicate tagName (중복검사)
	public Integer checkTag(String tagName) throws SQLException;
	
	//search
	public ArrayList<TagVO> checkTagDetail(String q) throws SQLException;
	
	//insert new tag
	public void insertTag(String tag) throws SQLException;
	
	//update delete 추가 작성
	
	//search products by tag
	public ArrayList<ProductVO> searchProductByTag(String tagName) throws SQLException;
	
	//search articles by tag
	public ArrayList<ArticleVO> searchArticleByTag(String tagName) throws SQLException ;
			
	//search all ptagno
	public ArrayList<TagVO> searchPTag() throws SQLException;

	//search all atagno
	public ArrayList<TagVO> searchATag() throws SQLException;
	
	//search all atagno + ptagno (중복제거)
	public ArrayList<TagVO> searchAPTag() throws SQLException;
	
	//search atagname by ano
	public ArrayList<String> searchTagByArticle(Integer articleNo) throws SQLException;
	
	//search ptagname by pno
	public ArrayList<TagVO> searchTagByProduct(Integer productNo) throws SQLException;
	
}
