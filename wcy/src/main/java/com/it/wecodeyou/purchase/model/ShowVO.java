package com.it.wecodeyou.purchase.model;

import java.sql.Timestamp;

public class ShowVO {

	private String purchaseProName;
	private Integer purchaseAmount;
	private Timestamp purchaseDate;  

	public ShowVO() {
		// TODO Auto-generated constructor stub
	}

	public ShowVO(String purchaseProName, Integer purchaseAmount, Timestamp purchaseDate) {
		super();
		this.purchaseProName = purchaseProName;
		this.purchaseAmount = purchaseAmount;
		this.purchaseDate = purchaseDate;
	}

	public String getPurchaseProName() {
		return purchaseProName;
	}

	public void setPurchaseProName(String purchaseProName) {
		this.purchaseProName = purchaseProName;
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

	@Override
	public String toString() {
		return "ShowVO [purchaseProName=" + purchaseProName + ", purchaseAmount=" + purchaseAmount + ", purchaseDate="
				+ purchaseDate + "]";
	}

	

}
