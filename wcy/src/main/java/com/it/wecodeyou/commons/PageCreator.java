package com.it.wecodeyou.commons;

public class PageCreator {
	
	private PageVO paging;
	private Integer articleTotalCount;//게시판의 총 게시물 수
	private Integer beginPage;//시작 페이지 번호
	private Integer endPage; //끝 페이지 번호
	private boolean prev; //이번 버튼 활성화 여부
	private boolean next; //다음 버튼 활성화 여부
	
	//한 화면에 보여질 페이지 수
	private final Integer displayPageNum = 10;
	
	//페이지 알고리즘을 수행할 메서드
	private void calcDataOfPage() {
		
		//보정 전 끝 페이지
		endPage = (int)Math.ceil(paging.getPage()
						/ (double)displayPageNum
						* displayPageNum);
		
		//시작 페이지 번호 구하기
		beginPage = (endPage - displayPageNum) + 1;
		
		if(beginPage < 1) {
			beginPage = 1;
		}
		//현재 시작페이지가 1이라면 이전버튼 활성화 여부를  false
		prev = (beginPage == 1) ? false : true;
		
		next = (articleTotalCount <= (endPage * paging.getCountPerPage())) ? false : true;
		
		if(!isNext()) {
			//끝 페이지 재보정하기
			endPage = (int)Math.ceil(articleTotalCount /
					(double)paging.getCountPerPage());
		}
	}



	public PageVO getPaging() {
		return paging;
	}

	public void setPaging(PageVO paging) {
		this.paging = paging;
	}

	public Integer getArticleTotalCount() {
		return articleTotalCount;
	}

	public void setArticleTotalCount(Integer articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}

	public Integer getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(Integer beginPage) {
		this.beginPage = beginPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Integer getDisplayPageNum() {
		return displayPageNum;
	}

	@Override
	public String toString() {
		return "PageCreator [paging=" + paging + ", articleTotalCount=" + articleTotalCount + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ "]";
	}
	
}
