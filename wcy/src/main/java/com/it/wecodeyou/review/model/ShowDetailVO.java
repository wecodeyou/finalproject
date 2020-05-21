package com.it.wecodeyou.review.model;

import java.sql.Timestamp;

public class ShowDetailVO {

	private Integer reviewNo;
	private String userName;			
	private Integer reviewProductNo;	
	private Integer reviewStar;
	private String content;
	private Timestamp reviewCreatedAt;

	public ShowDetailVO() {
		// TODO Auto-generated constructor stub
	}

	public ShowDetailVO(Integer reviewNo, String userName, Integer reviewProductNo, Integer reviewStar, String content,
			Timestamp reviewCreatedAt) {
		super();
		this.reviewNo = reviewNo;
		this.userName = userName;
		this.reviewProductNo = reviewProductNo;
		this.reviewStar = reviewStar;
		this.content = content;
		this.reviewCreatedAt = reviewCreatedAt;
	}

	public Integer getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(Integer reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getReviewProductNo() {
		return reviewProductNo;
	}

	public void setReviewProductNo(Integer reviewProductNo) {
		this.reviewProductNo = reviewProductNo;
	}

	public Integer getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(Integer reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReviewCreatedAt() {
		return reviewCreatedAt;
	}

	public void setReviewCreatedAt(Timestamp reviewCreatedAt) {
		this.reviewCreatedAt = reviewCreatedAt;
	}

	@Override
	public String toString() {
		return "ShowDetailVO [reviewNo=" + reviewNo + ", userName=" + userName + ", reviewProductNo=" + reviewProductNo
				+ ", reviewStar=" + reviewStar + ", content=" + content + ", reviewCreatedAt=" + reviewCreatedAt + "]";
	}


	
}
