package com.it.wecodeyou.board.repository;

import java.util.List;

import com.it.wecodeyou.board.model.BoardVO;
import com.it.wecodeyou.commons.PageVO;
import com.it.wecodeyou.search.model.SearchVO;

public interface IBoardMapper {
	//게시판 삽입문
	public Integer insertBoard(BoardVO rvo);

	//게시판 삭제
	public void deleteBoard(Integer boardNo);
	
	//게시판 수정
	public void updateBoard(BoardVO rvo);
	
	//게시판 리스트
	public List<BoardVO> getAllInfo();
	
	//단일 게시판 정보
	public BoardVO getInfoByNo(Integer boardNo);
	
	//게시글 페이징 목록 조회기능
	List<BoardVO> getArticleListPaging(PageVO paging);

	//제목으로 검색기능
	List<BoardVO> getArticleListByTitle(SearchVO search);

	//제목으로 검색 이후 게시물 수 조회기능
	Integer countArticlesByTitle(SearchVO search);

	//작성자로 검색기능
	List<BoardVO> getArticleListByWriter(SearchVO search);

	//작성자로 검색 이후 게시물 수 조회기능
	Integer countArticlesByWriter(SearchVO search);

	//총 게시물의 수 조회기능
	Integer countArticles();
	
	public Integer countReply(Integer articleNo);

}
