package com.it.wecodeyou.board.model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class ArticleTagVO {
	private Integer articleNo;
	private String articleTitle;
	private String articleContent;
	private String articleBoardTitle;
	private Integer articleClicks;
	private Integer articleLikes;
	private Integer articleEditorNo;
	private Timestamp articleCreatedAt;
	private Timestamp articleModifiedAt;

	
	ArticleTagVO(){}

	public ArticleTagVO(Integer articleNo, String articleTitle, String articleContent, String articleBoardTitle,
			Integer articleClicks, Integer articleLikes, Integer articleEditorNo, Timestamp articleCreatedAt,
			Timestamp articleModifiedAt) {
		super();
		this.articleNo = articleNo;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.articleBoardTitle = articleBoardTitle;
		this.articleClicks = articleClicks;
		this.articleLikes = articleLikes;
		this.articleEditorNo = articleEditorNo;
		this.articleCreatedAt = articleCreatedAt;
		this.articleModifiedAt = articleModifiedAt;
	}
	
	
	public ArticleTagVO(String articleTitle, String articleContent, String articleBoardTitle, Integer articleEditorNo) {
		super();
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.articleBoardTitle = articleBoardTitle;
		this.articleEditorNo = articleEditorNo;
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

	public String getArticleBoardTitle() {
		return articleBoardTitle;
	}

	public void setArticleBoardTitle(String articleBoardTitle) {
		this.articleBoardTitle = articleBoardTitle;
	}

	public Integer getArticleClicks() {
		return articleClicks;
	}

	public void setArticleClicks(Integer articleClicks) {
		this.articleClicks = articleClicks;
	}

	public Integer getArticleLikes() {
		return articleLikes;
	}

	public void setArticleLikes(Integer articleLikes) {
		this.articleLikes = articleLikes;
	}

	public Integer getArticleEditorNo() {
		return articleEditorNo;
	}

	public void setArticleEditorNo(Integer articleEditorNo) {
		this.articleEditorNo = articleEditorNo;
	}

	public Timestamp getArticleCreatedAt() {
		return articleCreatedAt;
	}

	public void setArticleCreatedAt(Timestamp articleCreatedAt) {
		this.articleCreatedAt = articleCreatedAt;
	}

	public Timestamp getArticleModifiedAt() {
		return articleModifiedAt;
	}

	public void setArticleModifiedAt(Timestamp articleModifiedAt) {
		this.articleModifiedAt = articleModifiedAt;
	}

	@Override
	public String toString() {
		return "ArticleTagVO [articleNo=" + articleNo + ", articleTitle=" + articleTitle + ", articleContent="
				+ articleContent + ", articleBoardTitle=" + articleBoardTitle + ", articleClicks=" + articleClicks
				+ ", articleLikes=" + articleLikes + ", articleEditorNo=" + articleEditorNo + ", articleCreatedAt="
				+ articleCreatedAt + ", articleModifiedAt=" + articleModifiedAt + "]";
	}
	
}
