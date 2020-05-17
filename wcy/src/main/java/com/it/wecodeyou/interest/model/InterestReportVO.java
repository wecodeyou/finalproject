package com.it.wecodeyou.interest.model;

public class InterestReportVO {
	private String interestIndex;
	private Integer cnt;
	
	public InterestReportVO() {
		super();
	}

	public InterestReportVO(String interestIndex, Integer cnt) {
		super();
		this.interestIndex = interestIndex;
		this.cnt = cnt;
	}

	public String getInterestIndex() {
		return interestIndex;
	}

	public void setInterestIndex(String interestIndex) {
		this.interestIndex = interestIndex;
	}

	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "InterestReportVO [interestIndex=" + interestIndex + ", cnt=" + cnt + "]";
	}
	
	
}




