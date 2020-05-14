package com.it.wecodeyou.purchase.model;


public class PurchaseResultVO {
	
	private String purchaseYM; 		//구매 년 월
	private String purchaseY;		//구매 연도
	private String purchaseM;		//구매 월
	private Integer earningAnnual;	//연간 수입 == (총 연간 수입 - 환불금)
	private Integer earningMonthly;	//월간 수입 == (총 월간 수입 - 환불금)
	private Integer purchaseCount; 	//총 거래 건수 == (환불건 포함한 값)
	private Integer earningCount; 	//수입 발생 건수 == (총 거래 건 - 환불건)
	private Integer refundCount;	//환불 발생 건수 
	private Integer refundSum;	  	//총 환불 금액 
	
	public PurchaseResultVO() {
		super();
	}

	public PurchaseResultVO(String purchaseYM, String purchaseY, String purchaseM, Integer earningAnnual,
			Integer earningMonthly, Integer purchaseCount, Integer earningCount, Integer refundCount,
			Integer refundSum) {
		super();
		this.purchaseYM = purchaseYM;
		this.purchaseY = purchaseY;
		this.purchaseM = purchaseM;
		this.earningAnnual = earningAnnual;
		this.earningMonthly = earningMonthly;
		this.purchaseCount = purchaseCount;
		this.earningCount = earningCount;
		this.refundCount = refundCount;
		this.refundSum = refundSum;
	}

	public String getPurchaseYM() {
		return purchaseYM;
	}

	public void setPurchaseYM(String purchaseYM) {
		this.purchaseYM = purchaseYM;
	}

	public String getPurchaseY() {
		return purchaseY;
	}

	public void setPurchaseY(String purchaseY) {
		this.purchaseY = purchaseY;
	}

	public String getPurchaseM() {
		return purchaseM;
	}

	public void setPurchaseM(String purchaseM) {
		this.purchaseM = purchaseM;
	}

	public Integer getEarningAnnual() {
		return earningAnnual;
	}

	public void setEarningAnnual(Integer earningAnnual) {
		this.earningAnnual = earningAnnual;
	}

	public Integer getEarningMonthly() {
		return earningMonthly;
	}

	public void setEarningMonthly(Integer earningMonthly) {
		this.earningMonthly = earningMonthly;
	}

	public Integer getPurchaseCount() {
		return purchaseCount;
	}

	public void setPurchaseCount(Integer purchaseCount) {
		this.purchaseCount = purchaseCount;
	}

	public Integer getEarningCount() {
		return earningCount;
	}

	public void setEarningCount(Integer earningCount) {
		this.earningCount = earningCount;
	}

	public Integer getRefundCount() {
		return refundCount;
	}

	public void setRefundCount(Integer refundCount) {
		this.refundCount = refundCount;
	}

	public Integer getRefundSum() {
		return refundSum;
	}

	public void setRefundSum(Integer refundSum) {
		this.refundSum = refundSum;
	}

	@Override
	public String toString() {
		return "PurchaseResultVO [purchaseYM=" + purchaseYM + ", purchaseY=" + purchaseY + ", purchaseM=" + purchaseM
				+ ", earningAnnual=" + earningAnnual + ", earningMonthly=" + earningMonthly + ", purchaseCount="
				+ purchaseCount + ", earningCount=" + earningCount + ", refundCount=" + refundCount + ", refundSum="
				+ refundSum + "]";
	}

	
	
	
}
