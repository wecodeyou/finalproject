package com.it.wecodeyou.on.model;

public class OnVO {

	private Integer onNo;
	private String onAuthor;
	private String onCategory;
	private Integer onProductNo;
	private String onUploadUri;
	private Integer onDays;
	public OnVO() {
		super();
	}
	public OnVO(Integer onNo, String onAuthor, String onCategory, Integer onProductNo, String onUploadUri,
			Integer onDays) {
		super();
		this.onNo = onNo;
		this.onAuthor = onAuthor;
		this.onCategory = onCategory;
		this.onProductNo = onProductNo;
		this.onUploadUri = onUploadUri;
		this.onDays = onDays;
	}
	public Integer getOnNo() {
		return onNo;
	}
	public void setOnNo(Integer onNo) {
		this.onNo = onNo;
	}
	public String getOnAuthor() {
		return onAuthor;
	}
	public void setOnAuthor(String onAuthor) {
		this.onAuthor = onAuthor;
	}
	public String getOnCategory() {
		return onCategory;
	}
	public void setOnCategory(String onCategory) {
		this.onCategory = onCategory;
	}
	public Integer getOnProductNo() {
		return onProductNo;
	}
	public void setOnProductNo(Integer onProductNo) {
		this.onProductNo = onProductNo;
	}
	public String getOnUploadUri() {
		return onUploadUri;
	}
	public void setOnUploadUri(String onUploadUri) {
		this.onUploadUri = onUploadUri;
	}
	public Integer getOnDays() {
		return onDays;
	}
	public void setOnDays(Integer onDays) {
		this.onDays = onDays;
	}
	@Override
	public String toString() {
		return "OnVO [onNo=" + onNo + ", onAuthor=" + onAuthor + ", onCategory=" + onCategory + ", onProductNo="
				+ onProductNo + ", onUploadUri=" + onUploadUri + ", onDays=" + onDays + "]";
	}
	
	
}
