package com.it.wecodeyou.board.repository;

import java.util.ArrayList;
import java.util.List;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.model.BoardVO;
import com.it.wecodeyou.commons.PageVO;
import com.it.wecodeyou.search.model.SearchVO;

public interface IArticleMapper {
	
	public Integer insert(ArticleVO avo);
	
	public void update(ArticleVO avo);
	
	public void delete(ArticleVO avo);
	
	public List<ArticleVO> list(PageVO paging);
	
	public ArticleVO getOneInfo(Integer articleNo);
	
	public Integer countArticles(Integer boardNo);
	
	//filter search
	public List<ArticleVO> getArticleListByTitle(SearchVO svo);

	public Integer countArticlesByTitle(SearchVO svo);

	public List<ArticleVO> getArticleListPaging(SearchVO svo);

	public Integer countArticles();
	
	public List<ArticleVO> getArticleByTitleContent(SearchVO svo);

	public Integer countArticlesByTitleContent(SearchVO svo);
	
	public ArrayList<ArticleVO> getAllByUserNo(Integer articleWriter);
	
	public ArrayList<ArticleVO> NotiList(Integer articleBoardNo);
	
}
