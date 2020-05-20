package com.it.wecodeyou.board.model;

import java.sql.Timestamp;

public class ShowArticleVO {
	
	private Integer articleNo;
	private String articleTitle;
	private String articleContent;
	private String articleBoardType;
	private Timestamp articleCreatedAt;
	
	public ShowArticleVO() {}

	public ShowArticleVO(Integer articleNo, String articleTitle, String articleContent, String articleBoardType,
			Timestamp articleCreatedAt) {
		super();
		this.articleNo = articleNo;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.articleBoardType = articleBoardType;
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

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public String getArticleBoardType() {
		return articleBoardType;
	}

	public void setArticleBoardType(String articleBoardType) {
		this.articleBoardType = articleBoardType;
	}

	public Timestamp getArticleCreatedAt() {
		return articleCreatedAt;
	}

	public void setArticleCreatedAt(Timestamp articleCreatedAt) {
		this.articleCreatedAt = articleCreatedAt;
	}

	@Override
	public String toString() {
		return "ShowArticleVO [articleNo=" + articleNo + ", articleTitle=" + articleTitle + ", articleContent="
				+ articleContent + ", articleBoardType=" + articleBoardType + ", articleCreatedAt=" + articleCreatedAt
				+ "]";
	}

	
	
	
}
