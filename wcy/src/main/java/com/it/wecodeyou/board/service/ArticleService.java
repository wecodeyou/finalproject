package com.it.wecodeyou.board.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.atag.repository.IAtagMapper;
import com.it.wecodeyou.board.model.ArticleVO;
import com.it.wecodeyou.board.model.BoardVO;
import com.it.wecodeyou.board.repository.IArticleMapper;

import com.it.wecodeyou.tag.model.TagVO;
import com.it.wecodeyou.tag.repository.ITagMapper;

import com.it.wecodeyou.commons.PageVO;
import com.it.wecodeyou.search.model.SearchVO;

@Service
public class ArticleService implements IArticleService {

	@Autowired
	private IArticleMapper dao;
	
	@Autowired
	private IAtagMapper atagDao;
	
	@Autowired
	private ITagMapper tagDao;

	
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
	public ArrayList<String> searchTagByArticle(Integer articleNo) throws SQLException {
		return tagDao.searchTagByArticle(articleNo);
	}

	public Integer countArticles(Integer boardNo) {
		return dao.countArticles(boardNo);
	}

	@Override
	public List<ArticleVO> getArticleListByTitle(SearchVO svo) {
		return dao.getArticleListByTitle(svo);
	}

	@Override
	public Integer countArticlesByTitle(SearchVO svo) {
		return dao.countArticlesByTitle(svo);
	}

	@Override
	public List<ArticleVO> getArticleListPaging(SearchVO svo) {
		return dao.getArticleListPaging(svo);
	}

	@Override
	public Integer countArticles() {
		return dao.countArticles();
	}

	@Override
	public List<ArticleVO> getArticleByTitleContent(SearchVO svo) {
		return dao.getArticleByTitleContent(svo);
	}

	@Override
	public Integer countArticlesByTitleContent(SearchVO svo) {
		return dao.countArticlesByTitleContent(svo);
	}

	@Override
	public ArrayList<ArticleVO> getAllByUserNo(Integer articleWriter) {
		return dao.getAllByUserNo(articleWriter);
	}

	@Override
	public ArrayList<ArticleVO> NotiList(Integer articleBoardNo) {
		
		return dao.NotiList(articleBoardNo);
	}

	@Override
	public void increaseView(Integer articleNo) {
		dao.increaseView(articleNo);
		
	}


	
}
