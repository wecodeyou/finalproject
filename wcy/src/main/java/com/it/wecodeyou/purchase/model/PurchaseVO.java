package com.it.wecodeyou.purchase.model;

import java.sql.Timestamp;

public class PurchaseVO {

	private Integer purchaseNo;
	private Integer purchaseProNo;
	private Integer purchaseAmount;
	private Integer purchaseBuyer;
	private Integer purchaseSeatNo;
	private Timestamp purchaseDate;  
	private boolean purchaseIsrefund;
	private Timestamp purchaseRefundDate;
	
	public PurchaseVO() {
		// TODO Auto-generated constructor stub
	}

	public PurchaseVO(Integer purchaseNo, Integer purchaseProNo, Integer purchaseAmount, Integer purchaseBuyer,
			Integer purchaseSeatNo, Timestamp purchaseDate, boolean purchaseIsrefund, Timestamp purchaseRefundDate) {
		super();
		this.purchaseNo = purchaseNo;
		this.purchaseProNo = purchaseProNo;
		this.purchaseAmount = purchaseAmount;
		this.purchaseBuyer = purchaseBuyer;
		this.purchaseSeatNo = purchaseSeatNo;
		this.purchaseDate = purchaseDate;
		this.purchaseIsrefund = purchaseIsrefund;
		this.purchaseRefundDate = purchaseRefundDate;
	}

	public Integer getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(Integer purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public Integer getPurchaseProNo() {
		return purchaseProNo;
	}

	public void setPurchaseProNo(Integer purchaseProNo) {
		this.purchaseProNo = purchaseProNo;
	}

	public Integer getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(Integer purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public Integer getPurchaseBuyer() {
		return purchaseBuyer;
	}

	public void setPurchaseBuyer(Integer purchaseBuyer) {
		this.purchaseBuyer = purchaseBuyer;
	}

	public Integer getPurchaseSeatNo() {
		return purchaseSeatNo;
	}

	public void setPurchaseSeatNo(Integer purchaseSeatNo) {
		this.purchaseSeatNo = purchaseSeatNo;
	}

	public Timestamp getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Timestamp purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public boolean isPurchaseIsrefund() {
		return purchaseIsrefund;
	}

	public void setPurchaseIsrefund(boolean purchaseIsrefund) {
		this.purchaseIsrefund = purchaseIsrefund;
	}

	public Timestamp getPurchaseRefundDate() {
		return purchaseRefundDate;
	}

	public void setPurchaseRefundDate(Timestamp purchaseRefundDate) {
		this.purchaseRefundDate = purchaseRefundDate;
	}

	@Override
	public String toString() {
		return "PurchaseVO [purchaseNo=" + purchaseNo + ", purchaseProNo=" + purchaseProNo + ", purchaseAmount="
				+ purchaseAmount + ", purchaseBuyer=" + purchaseBuyer + ", purchaseSeatNo=" + purchaseSeatNo
				+ ", purchaseDate=" + purchaseDate + ", purchaseIsrefund=" + purchaseIsrefund + ", purchaseRefundDate="
				+ purchaseRefundDate + "]";
	}
	
	
	
	
	
	
	
}
