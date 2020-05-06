package com.it.wecodeyou.board.model;

import java.sql.Timestamp;

public class ReplyUserVO {
	private long replyNo;
	private String replyContent;
	private String replyTitle;
	private Timestamp replyCreatedAt;
	private Timestamp replyModifiedAt;
	private boolean replyIsRemoved;
	private Integer replyOrder;
	private long replyParent;
	private Integer replyDepth;
	private Integer replyLikes;
	private long replyArticleNo;
	private String replyWriter;
	private String userEmail;
	private String userName;
	
	public ReplyUserVO() {}
	public ReplyUserVO(long replyNo, String replyContent, String replyTitle, Timestamp replyCreatedAt,
			Timestamp replyModifiedAt, boolean replyIsRemoved, Integer replyOrder, long replyParent, Integer replyDepth,
			Integer replyLikes, long replyArticleNo, String replyWriter, String userEmail, String userName) {
		super();
		this.replyNo = replyNo;
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
		this.replyWriter = replyWriter;
		this.userEmail = userEmail;
		this.userName = userName;
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
	public boolean isReplyIsRemoved() {
		return replyIsRemoved;
	}
	public void setReplyIsRemoved(boolean replyIsRemoved) {
		this.replyIsRemoved = replyIsRemoved;
	}
	public Integer getReplyOrder() {
		return replyOrder;
	}
	public void setReplyOrder(Integer replyOrder) {
		this.replyOrder = replyOrder;
	}
	public long getReplyParent() {
		return replyParent;
	}
	public void setReplyParent(long replyParent) {
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
	public long getReplyArticleNo() {
		return replyArticleNo;
	}
	public void setReplyArticleNo(long replyArticleNo) {
		this.replyArticleNo = replyArticleNo;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "ReplyUserVO [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyTitle=" + replyTitle
				+ ", replyCreatedAt=" + replyCreatedAt + ", replyModifiedAt=" + replyModifiedAt + ", replyIsRemoved="
				+ replyIsRemoved + ", replyOrder=" + replyOrder + ", replyParent=" + replyParent + ", replyDepth="
				+ replyDepth + ", replyLikes=" + replyLikes + ", replyArticleNo=" + replyArticleNo + ", replyWriter="
				+ replyWriter + ", userEmail=" + userEmail + ", userName=" + userName + "]";
	}
	
	
}
