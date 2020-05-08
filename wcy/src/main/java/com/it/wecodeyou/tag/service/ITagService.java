package com.it.wecodeyou.tag.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.product.model.ProductVO;
import com.it.wecodeyou.tag.model.TagVO;

public interface ITagService {
   
      //select all
      public ArrayList<TagVO> getAllTag() throws SQLException ;
      
      //search tagname by tagno
      public String getTagName(Integer tagNo) throws SQLException;
      
      //check duplicate tagName
      public Integer checkTag(String tagName) throws SQLException ;
      
      //search
      public ArrayList<TagVO> checkTagDetail(String q) throws SQLException;
      
      //insert new tag
      public boolean insertTag(String tag) throws SQLException ;

      //update delete 추가 작성
      
      //search products by tag
      public ArrayList<ProductVO> searchProductByTag(Integer tagNo) throws SQLException ;
      
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
      


}