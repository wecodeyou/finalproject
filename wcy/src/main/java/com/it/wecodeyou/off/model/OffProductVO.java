package com.it.wecodeyou.off.model;

import java.sql.Timestamp;
import java.util.ArrayList;

//오프라인강의 등록을 할때 정보를 한번에 가져오기위한 VO
public class OffProductVO {
	private Integer productNo;
	private String productType;
	private String productName;
	private Integer productPrice;
	private String productDetail;
	private Timestamp productCreatedAt;
	private String productThumb;
	private Integer offNo;
	private String offAuthor;
	private String offCategory;
	private Integer offProductNo;
	private String offPlace;
	private String offUploadUri;
	private Integer offSeats;
	private Timestamp offStartAt;
	private Timestamp offEndAt;
	private Timestamp offCreatedAt;
	private Timestamp offModifiedAt;
	private ArrayList<Integer> sendTagList;
	
	public OffProductVO() {}

	public OffProductVO(Integer productNo, String productType, String productName, Integer productPrice,
			String productDetail, Timestamp productCreatedAt, String productThumb, Integer offNo, String offAuthor,
			String offCategory, Integer offProductNo, String offPlace, String offUploadUri, Integer offSeats,
			Timestamp offStartAt, Timestamp offEndAt, Timestamp offCreatedAt, Timestamp offModifiedAt,
			ArrayList<Integer> sendTagList) {
		super();
		this.productNo = productNo;
		this.productType = productType;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDetail = productDetail;
		this.productCreatedAt = productCreatedAt;
		this.productThumb = productThumb;
		this.offNo = offNo;
		this.offAuthor = offAuthor;
		this.offCategory = offCategory;
		this.offProductNo = offProductNo;
		this.offPlace = offPlace;
		this.offUploadUri = offUploadUri;
		this.offSeats = offSeats;
		this.offStartAt = offStartAt;
		this.offEndAt = offEndAt;
		this.offCreatedAt = offCreatedAt;
		this.offModifiedAt = offModifiedAt;
		this.sendTagList = sendTagList;
	}

	public long getProductNo() {
		return productNo;
	}

	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public Timestamp getProductCreatedAt() {
		return productCreatedAt;
	}

	public void setProductCreatedAt(Timestamp productCreatedAt) {
		this.productCreatedAt = productCreatedAt;
	}

	public String getProductThumb() {
		return productThumb;
	}

	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}

	public long getOffNo() {
		return offNo;
	}

	public void setOffNo(Integer offNo) {
		this.offNo = offNo;
	}

	public String getOffAuthor() {
		return offAuthor;
	}

	public void setOffAuthor(String offAuthor) {
		this.offAuthor = offAuthor;
	}

	public String getOffCategory() {
		return offCategory;
	}

	public void setOffCategory(String offCategory) {
		this.offCategory = offCategory;
	}

	public long getOffProductNo() {
		return offProductNo;
	}

	public void setOffProductNo(Integer offProductNo) {
		this.offProductNo = offProductNo;
	}

	public String getOffPlace() {
		return offPlace;
	}

	public void setOffPlace(String offPlace) {
		this.offPlace = offPlace;
	}

	public String getOffUploadUri() {
		return offUploadUri;
	}

	public void setOffUploadUri(String offUploadUri) {
		this.offUploadUri = offUploadUri;
	}

	public Integer getOffSeats() {
		return offSeats;
	}

	public void setOffSeats(Integer offSeats) {
		this.offSeats = offSeats;
	}

	public Timestamp getOffStartAt() {
		return offStartAt;
	}

	public void setOffStartAt(Timestamp offStartAt) {
		this.offStartAt = offStartAt;
	}

	public Timestamp getOffEndAt() {
		return offEndAt;
	}

	public void setOffEndAt(Timestamp offEndAt) {
		this.offEndAt = offEndAt;
	}

	public Timestamp getOffCreatedAt() {
		return offCreatedAt;
	}

	public void setOffCreatedAt(Timestamp offCreatedAt) {
		this.offCreatedAt = offCreatedAt;
	}

	public Timestamp getOffModifiedAt() {
		return offModifiedAt;
	}

	public void setOffModifiedAt(Timestamp offModifiedAt) {
		this.offModifiedAt = offModifiedAt;
	}

	public ArrayList<Integer> getSendTagList() {
		return sendTagList;
	}

	public void setSendTagList(ArrayList<Integer> sendTagList) {
		this.sendTagList = sendTagList;
	}

	@Override
	public String toString() {
		return "OffProductVO [productNo=" + productNo + ", productType=" + productType + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productDetail=" + productDetail + ", productCreatedAt="
				+ productCreatedAt + ", productThumb=" + productThumb + ", offNo=" + offNo + ", offAuthor=" + offAuthor
				+ ", offCategory=" + offCategory + ", offProductNo=" + offProductNo + ", offPlace=" + offPlace
				+ ", offUploadUri=" + offUploadUri + ", offSeats=" + offSeats + ", offStartAt=" + offStartAt
				+ ", offEndAt=" + offEndAt + ", offCreatedAt=" + offCreatedAt + ", offModifiedAt=" + offModifiedAt
				+ ", sendTagList=" + sendTagList + "]";
	}
	
	
}
