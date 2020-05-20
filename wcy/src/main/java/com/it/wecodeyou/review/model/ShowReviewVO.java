package com.it.wecodeyou.review.model;

import java.sql.Timestamp;

public class ShowReviewVO {
	
	private Integer reviewNo;
	private String reviewProductName;
	private Integer reviewStar;
	private String content;
	private Timestamp reviewCreatedAt;
	
	public ShowReviewVO() {}

	public ShowReviewVO(Integer reviewNo, String reviewProductName, Integer reviewStar, String content,
			Timestamp reviewCreatedAt) {
		super();
		this.reviewNo = reviewNo;
		this.reviewProductName = reviewProductName;
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

	public String getReviewProductName() {
		return reviewProductName;
	}

	public void setReviewProductName(String reviewProductName) {
		this.reviewProductName = reviewProductName;
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
		return "ShowReviewVO [reviewNo=" + reviewNo + ", reviewProductName=" + reviewProductName + ", reviewStar="
				+ reviewStar + ", content=" + content + ", reviewCreatedAt=" + reviewCreatedAt + "]";
	}

	
	
}
