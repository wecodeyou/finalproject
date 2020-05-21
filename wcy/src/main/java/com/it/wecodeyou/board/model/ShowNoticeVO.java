package com.it.wecodeyou.board.model;

import java.sql.Date;
import java.sql.Timestamp;

public class ShowNoticeVO {

	private Integer articleNo;
	private String articleTitle;
	private Date articleCreatedAt;

	public ShowNoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public ShowNoticeVO(Integer articleNo, String articleTitle, Date articleCreatedAt) {
		super();
		this.articleNo = articleNo;
		this.articleTitle = articleTitle;
		this.articleCreatedAt = articleCreatedAt;
	}

	public Integer getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(Integer articleNo) {
		this.articleNo = articleNo;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public Date getArticleCreatedAt() {
		return articleCreatedAt;
	}

	public void setArticleCreatedAt(Date articleCreatedAt) {
		this.articleCreatedAt = articleCreatedAt;
	}

	@Override
	public String toString() {
		return "ShowNoticeVO [articleNo=" + articleNo + ", articleTitle=" + articleTitle + ", articleCreatedAt="
				+ articleCreatedAt + "]";
	}
	
	
	
}
