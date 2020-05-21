package com.it.wecodeyou.board.model;

import java.sql.Timestamp;


/*parent: 부모 댓글
depth: 댓글 순위
order: 같은 댓글을 가진 답글들의 순위*/
public class ReplyVO {
	private Integer replyNo;
	private Integer replyWriter;
	private String replyContent;
	private String replyTitle;
	private Timestamp replyCreatedAt;
	private Timestamp replyModifiedAt;
	private Integer replyIsRemoved;
	private Integer replyOrder;
	private Integer replyParent;
	private Integer replyDepth;
	private Integer replyLikes;
	private Integer replyArticleNo;
	
	public ReplyVO() {}

	public ReplyVO(Integer replyNo, Integer replyWriter, String replyContent, String replyTitle,
			Timestamp replyCreatedAt, Timestamp replyModifiedAt, Integer replyIsRemoved, Integer replyOrder,
			Integer replyParent, Integer replyDepth, Integer replyLikes, Integer replyArticleNo) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyTitle = replyTitle;
		this.replyCreatedAt = replyCreatedAt;
		this.replyModifiedAt = replyModifiedAt;
		this.replyIsRemoved = replyIsRemoved;
		this.replyOrder = replyOrder;
		this.replyParent = replyParent;
		this.replyDepth = replyDepth;
		this.replyLikes = replyLikes;
		this.replyArticleNo = replyArticleNo;
	}

	public Integer getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(Integer replyNo) {
		this.replyNo = replyNo;
	}

	public Integer getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(Integer replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public Timestamp getReplyCreatedAt() {
		return replyCreatedAt;
	}

	public void setReplyCreatedAt(Timestamp replyCreatedAt) {
		this.replyCreatedAt = replyCreatedAt;
	}

	public Timestamp getReplyModifiedAt() {
		return replyModifiedAt;
	}

	public void setReplyModifiedAt(Timestamp replyModifiedAt) {
		this.replyModifiedAt = replyModifiedAt;
	}

	public Integer getReplyIsRemoved() {
		return replyIsRemoved;
	}

	public void setReplyIsRemoved(Integer replyIsRemoved) {
		this.replyIsRemoved = replyIsRemoved;
	}

	public Integer getReplyOrder() {
		return replyOrder;
	}

	public void setReplyOrder(Integer replyOrder) {
		this.replyOrder = replyOrder;
	}

	public Integer getReplyParent() {
		return replyParent;
	}

	public void setReplyParent(Integer replyParent) {
		this.replyParent = replyParent;
	}

	public Integer getReplyDepth() {
		return replyDepth;
	}

	public void setReplyDepth(Integer replyDepth) {
		this.replyDepth = replyDepth;
	}

	public Integer getReplyLikes() {
		return replyLikes;
	}

	public void setReplyLikes(Integer replyLikes) {
		this.replyLikes = replyLikes;
	}

	public Integer getReplyArticleNo() {
		return replyArticleNo;
	}

	public void setReplyArticleNo(Integer replyArticleNo) {
		this.replyArticleNo = replyArticleNo;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", replyContent=" + replyContent
				+ ", replyTitle=" + replyTitle + ", replyCreatedAt=" + replyCreatedAt + ", replyModifiedAt="
				+ replyModifiedAt + ", replyIsRemoved=" + replyIsRemoved + ", replyOrder=" + replyOrder
				+ ", replyParent=" + replyParent + ", replyDepth=" + replyDepth + ", replyLikes=" + replyLikes
				+ ", replyArticleNo=" + replyArticleNo + "]";
	}

	
}
