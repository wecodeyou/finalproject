package com.it.wecodeyou.board.service;

import java.util.List;

import com.it.wecodeyou.board.model.ArticleTagVO;
import com.it.wecodeyou.board.model.ArticleVO;

public interface IArticleService {

	
	public Integer insert(ArticleVO avo);
	
	public void update(ArticleVO avo);
	
	public void delete(ArticleVO avo);
	
	public List<ArticleVO> list(Integer boardNo);
	
	public ArticleVO getOneInfo(Integer articleNo);
}
