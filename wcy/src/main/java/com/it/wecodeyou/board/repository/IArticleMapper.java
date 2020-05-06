package com.it.wecodeyou.board.repository;

import java.util.List;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.commons.PageVO;

public interface IArticleMapper {
	
	public Integer insert(ArticleVO avo);
	
	public void update(ArticleVO avo);
	
	public void delete(ArticleVO avo);
	
	public List<ArticleVO> list(PageVO paging);
	
	public ArticleVO getOneInfo(Integer articleNo);
	
	public Integer countArticles(Integer boardNo);
}
