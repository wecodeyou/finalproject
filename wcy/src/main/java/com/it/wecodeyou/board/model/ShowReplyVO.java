package com.it.wecodeyou.board.model;

import java.sql.Timestamp;

public class ShowReplyVO {
	private long replyNo;
	private String replyContent;
	private Timestamp replyCreatedAt;
	private String replyArticleTitle;
	
	public ShowReplyVO() {}

	public ShowReplyVO(long replyNo, String replyContent, Timestamp replyCreatedAt, String replyArticleTitle) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyCreatedAt = replyCreatedAt;
		this.replyArticleTitle = replyArticleTitle;
	}

	public long getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(long replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Timestamp getReplyCreatedAt() {
		return replyCreatedAt;
	}

	public void setReplyCreatedAt(Timestamp replyCreatedAt) {
		this.replyCreatedAt = replyCreatedAt;
	}

	public String getReplyArticleTitle() {
		return replyArticleTitle;
	}

	public void setReplyArticleTitle(String replyArticleTitle) {
		this.replyArticleTitle = replyArticleTitle;
	}

	@Override
	public String toString() {
		return "ShowReplyVO [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyCreatedAt="
				+ replyCreatedAt + ", replyArticleTitle=" + replyArticleTitle + "]";
	}
	
}
