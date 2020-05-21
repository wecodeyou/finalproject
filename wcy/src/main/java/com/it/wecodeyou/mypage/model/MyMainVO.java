package com.it.wecodeyou.mypage.model;

import java.sql.Timestamp;

public class MyMainVO {

	private Integer purchaseNo;
	private Integer productNo;
	private String productName;
	private Integer productType;
	private String spThum;
	private String spLecName;
	private Integer purchaseAmount;
	private Timestamp purchaseDate;
	private Timestamp offStartAt;
	private Timestamp offEndAt;
	private String offPlace;
	private String offRoom;
	private Integer isWrite;
	
	public MyMainVO() {
		// TODO Auto-generated constructor stub
	}

	public MyMainVO(Integer purchaseNo, Integer productNo, String productName, Integer productType, String spThum,
			String spLecName, Integer purchaseAmount, Timestamp purchaseDate, Timestamp offStartAt, Timestamp offEndAt,
			String offPlace, String offRoom, Integer isWrite) {
		super();
		this.purchaseNo = purchaseNo;
		this.productNo = productNo;
		this.productName = productName;
		this.productType = productType;
		this.spThum = spThum;
		this.spLecName = spLecName;
		this.purchaseAmount = purchaseAmount;
		this.purchaseDate = purchaseDate;
		this.offStartAt = offStartAt;
		this.offEndAt = offEndAt;
		this.offPlace = offPlace;
		this.offRoom = offRoom;
		this.isWrite = isWrite;
	}

	public Integer getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(Integer purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public Integer getProductNo() {
		return productNo;
	}

	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProductType() {
		return productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

	public String getSpThum() {
		return spThum;
	}

	public void setSpThum(String spThum) {
		this.spThum = spThum;
	}

	public String getSpLecName() {
		return spLecName;
	}

	public void setSpLecName(String spLecName) {
		this.spLecName = spLecName;
	}

	public Integer getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(Integer purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public Timestamp getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Timestamp purchaseDate) {
		this.purchaseDate = purchaseDate;
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

	public String getOffPlace() {
		return offPlace;
	}

	public void setOffPlace(String offPlace) {
		this.offPlace = offPlace;
	}

	public String getOffRoom() {
		return offRoom;
	}

	public void setOffRoom(String offRoom) {
		this.offRoom = offRoom;
	}

	public Integer getIsWrite() {
		return isWrite;
	}

	public void setIsWrite(Integer isWrite) {
		this.isWrite = isWrite;
	}

	@Override
	public String toString() {
		return "MyMainVO [purchaseNo=" + purchaseNo + ", productNo=" + productNo + ", productName=" + productName
				+ ", productType=" + productType + ", spThum=" + spThum + ", spLecName=" + spLecName
				+ ", purchaseAmount=" + purchaseAmount + ", purchaseDate=" + purchaseDate + ", offStartAt=" + offStartAt
				+ ", offEndAt=" + offEndAt + ", offPlace=" + offPlace + ", offRoom=" + offRoom + ", isWrite=" + isWrite
				+ "]";
	}

	
	



}
