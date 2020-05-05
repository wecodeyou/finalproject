package com.it.wecodeyou.board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.atag.repository.IAtagMapper;
import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.repository.IArticleMapper;
import com.it.wecodeyou.commons.PageVO;

@Service
public class ArticleService implements IArticleService {

	@Autowired
	private IArticleMapper dao;
	
	@Autowired
	private IAtagMapper atagDao;
	
	@Override
	public Integer insert(ArticleVO avo, ArrayList<Integer> sendTagList) {
		Integer result = dao.insert(avo);
		System.out.println("avo.getArticleNo(): " + avo.getArticleNo());
		if(result == 1) {
			//insert into tag_article table
			for (int i = 0; i < sendTagList.size(); i++) {
				try {
					atagDao.insertAtag(sendTagList.get(i), avo.getArticleNo());
				} catch (SQLException e) {
					System.out.println("dao insertAtag Exeption!: " + sendTagList.get(i));
					e.printStackTrace();
				}
			}
		}
		return result;
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
	public List<ArticleVO> list(PageVO paging) {
		return dao.list(paging);
	}

	@Override
	public ArticleVO getOneInfo(Integer articleNo) {
		return dao.getOneInfo(articleNo);
	}

	@Override
	public Integer countArticles(Integer boardNo) {
		return dao.countArticles(boardNo);
	}

	
}
