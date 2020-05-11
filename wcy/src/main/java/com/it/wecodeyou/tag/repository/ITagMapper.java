package com.it.wecodeyou.tag.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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
   public ArrayList<String> searchTagByAllProduct(Integer productNo) throws SQLException;
   
   //search on off product by productNo and productType
   public ArrayList<String> searchTags(@Param("productNo") Integer productNo) throws SQLException;
   
   //product - all keywordList로 검색(paging처리 O)
   public ArrayList<ProductVO> searchAllProductByKeywordList(SearchVO svo) throws SQLException;
   
   //product - online keywordList로 검색(paging처리 O)
   public ArrayList<ProductVO> searchOnlineByKeywordList(SearchVO svo) throws SQLException;
   
   //product - offline keywordList로 검색(paging처리 O)
   public ArrayList<ProductVO> searchOfflineByKeywordList(SearchVO svo) throws SQLException;
   
   //product - product keywordList로 검색(paging처리 O)
   public ArrayList<ProductVO> searchProductByKeywordList(SearchVO svo) throws SQLException;
   
   //productType
   public ArrayList<ProductVO> productByKeywordList(SearchVO svo) throws SQLException;

   //search article by %tag%
   public List<ArticleVO> getArticleByHashtag(SearchVO svo);

   //count article by tags
   public Integer countArticlesByHashtag(SearchVO svo);

   //페이징을 위한 상품 개수
   public Integer countProductsByKeywordList(SearchVO svo);

 //search products by %tag%
   public List<ProductVO> getProductByHashtag(SearchVO svo);
   
   
   
   
   
   
   
   

   
}