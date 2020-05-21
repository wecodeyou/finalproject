package com.it.wecodeyou.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wecodeyou.board.model.BoardVO;
import com.it.wecodeyou.board.repository.IBoardMapper;
import com.it.wecodeyou.commons.PageVO;
import com.it.wecodeyou.search.model.SearchVO;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private IBoardMapper dao;
	
	
	@Override
	public Integer insert(BoardVO rvo) {
		return dao.insertBoard(rvo);

	}

	@Override
	public void delete(Integer boardNo) {
		dao.deleteBoard(boardNo);
	}

	@Override
	public void update(BoardVO rvo) {
		dao.updateBoard(rvo);

	}

	@Override
	public List<BoardVO> list() {
	
		return dao.getAllInfo();
	}

	@Override
	public BoardVO getInfoByNo(Integer boardNo) {
		return dao.getInfoByNo(boardNo);
	}

	@Override
	public Integer countReply(Integer articleNo) {
		// TODO Auto-generated method stub
		return dao.countReply(articleNo);
	}


}
