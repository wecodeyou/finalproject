package com.it.wecodeyou.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.repository.IArticleMapper;

@Service
public class ArticleService implements IArticleService {

	@Autowired
	private IArticleMapper dao;
	
	@Override
	public Integer insert(ArticleVO avo) {
		return dao.insert(avo);
	}

	@Override
	public void update(ArticleVO avo) {
		dao.update(avo);
		
	}

	@Override
	public void delete(ArticleVO avo) {
		dao.delete(avo);
		
	}

	@Override
	public List<ArticleVO> list(Integer boardNo) {
		return dao.list(boardNo);
	}

	@Override
	public ArticleVO getOneInfo(Integer articleNo) {
		return dao.getOneInfo(articleNo);
	}

	
}
