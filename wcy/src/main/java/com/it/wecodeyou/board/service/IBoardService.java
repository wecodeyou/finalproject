package com.it.wecodeyou.board.service;

import java.util.List;

import com.it.wecodeyou.board.model.BoardVO;

public interface IBoardService {

	//게시판 삽입문
	public Integer insert(BoardVO rvo);

	//게시판 삭제
	public void delete(Integer boardNo);
	
	//게시판 수정
	public void update(BoardVO rvo);
	
	//게시판 리스트
	public List<BoardVO> list();
	
	public BoardVO getInfoByNo(Integer boardNo);
}
