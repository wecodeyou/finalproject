package com.it.wecodeyou.tag.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.search.model.SearchVO;
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
   
   //tag update delete 추가 작성
   
   //search products by tag
   public ArrayList<ProductVO> searchProductByTag(Integer tagNo) throws SQLException;
   
   //search articles by tag
   public ArrayList<ArticleVO> searchArticleByTag(Integer tagNo) throws SQLException ;
         
   //search all ptagno
   public ArrayList<TagVO> searchPTagNo() throws SQLException;

   //search all atagno
   public ArrayList<TagVO> searchATagNo() throws SQLException;
   
   //search all atagno + ptagno (중복제거)
   public ArrayList<TagVO> searchAPTagNo() throws SQLException;
   
   //search atagname by ano
   public ArrayList<String> searchTagByArticle(Integer articleNo) throws SQLException;
   
   //search ptagname by pno
   public ArrayList<TagVO> searchTagByProduct(Integer productNo) throws SQLException;
   
   //article 세부 검색(paging처리 O) 검색어로 title, content 검색
   public ArrayList<ArticleVO> searchArticleByKeyWord(SearchVO svo) throws SQLException;
   
   //article 메인 검색(paging처리 X) 검색어로 title, content 검색
   public ArrayList<ArticleVO> searchAllArticleByKeyWord(SearchVO svo) throws SQLException;
   
   //product 세부 검색(paging처리 O) 검색어로 name, detail 검색
   public ArrayList<ProductVO> searchProductByKeyWord(SearchVO svo) throws SQLException;
   
   //article 메인 검색(paging처리 X) 검색어로 name, detail 검색
   public ArrayList<ProductVO> searchAllProductByKeyWord(SearchVO svo) throws SQLException;
   
   //article keywordList로 검색(paging처리 O)
   public ArrayList<ArticleVO> searchArticleByKeywordList(SearchVO svo) throws SQLException;
   
   //product keywordList로 검색(paging처리 O)
   public ArrayList<ProductVO> searchProductByKeywordList(SearchVO svo) throws SQLException;
   
   

   
}