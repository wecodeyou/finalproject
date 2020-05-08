package com.it.wecodeyou.board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.commons.PageVO;

public interface IArticleService {

	
	public Integer insert(ArticleVO avo, ArrayList<Integer> sendTagList);
	
	public void update(ArticleVO avo);
	
	public void delete(ArticleVO avo);
	
	public List<ArticleVO> list( PageVO paging);
	
	public ArticleVO getOneInfo(Integer articleNo);
	
	//search atagname by ano
	public ArrayList<String> searchTagByArticle(Integer articleNo) throws SQLException;
			
	public Integer countArticles(Integer boardNo);
}
