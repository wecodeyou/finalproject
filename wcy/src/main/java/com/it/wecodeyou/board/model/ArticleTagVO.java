package com.it.wecodeyou.board.model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class ArticleTagVO {
	private Integer articleNo;
	private String articleTitle;
	private String articleContent;
	private Integer articleWriter;
	private Integer articleBoardNo;
	private Integer articleClicks;
	private Integer articleLikes;
	private Timestamp articleCreatedAt;
	private Timestamp articleModifiedAt;
	private ArrayList<Integer> sendTagList;

	ArticleTagVO(){}

	public ArticleTagVO(Integer articleNo, String articleTitle, String articleContent, Integer articleWriter,
			Integer articleBoardNo, Integer articleClicks, Integer articleLikes, Timestamp articleCreatedAt,
			Timestamp articleModifiedAt, ArrayList<Integer> sendTagList) {
		super();
		this.articleNo = articleNo;
		this.articleTitle = articleTitle;
		this.articleContent = articleContent;
		this.articleWriter = articleWriter;
		this.articleBoardNo = articleBoardNo;
		this.articleClicks = articleClicks;
		this.articleLikes = articleLikes;
		this.articleCreatedAt = articleCreatedAt;
		this.articleModifiedAt = articleModifiedAt;
		this.sendTagList = sendTagList;
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

	public Integer getArticleWriter() {
		return articleWriter;
	}

	public void setArticleWriter(Integer articleWriter) {
		this.articleWriter = articleWriter;
	}

	public Integer getArticleBoardNo() {
		return articleBoardNo;
	}

	public void setArticleBoardNo(Integer articleBoardNo) {
		this.articleBoardNo = articleBoardNo;
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

	public ArrayList<Integer> getSendTagList() {
		return sendTagList;
	}

	public void setSendTagList(ArrayList<Integer> sendTagList) {
		this.sendTagList = sendTagList;
	}

	@Override
	public String toString() {
		return "ArticleTagVO [articleNo=" + articleNo + ", articleTitle=" + articleTitle + ", articleContent="
				+ articleContent + ", articleWriter=" + articleWriter + ", articleBoardNo=" + articleBoardNo
				+ ", articleClicks=" + articleClicks + ", articleLikes=" + articleLikes + ", articleCreatedAt="
				+ articleCreatedAt + ", articleModifiedAt=" + articleModifiedAt + ", sendTagList=" + sendTagList + "]";
	}

	
}
