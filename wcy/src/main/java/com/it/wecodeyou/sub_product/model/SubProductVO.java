package com.it.wecodeyou.sub_product.model;

public class SubProductVO {

	private Integer spId;
	private Integer spProId;
	private String spLecName;
	private String spThum;
	private String spBook;
	
	public SubProductVO() {
		// TODO Auto-generated constructor stub
	}

	public SubProductVO(Integer spId, Integer spProId, String spLecName, String spThum, String spBook) {
		super();
		this.spId = spId;
		this.spProId = spProId;
		this.spLecName = spLecName;
		this.spThum = spThum;
		this.spBook = spBook;
	}

	public Integer getSpId() {
		return spId;
	}

	public void setSpId(Integer spId) {
		this.spId = spId;
	}

	public Integer getSpProId() {
		return spProId;
	}

	public void setSpProId(Integer spProId) {
		this.spProId = spProId;
	}

	public String getSpLecName() {
		return spLecName;
	}

	public void setSpLecName(String spLecName) {
		this.spLecName = spLecName;
	}

	public String getSpThum() {
		return spThum;
	}

	public void setSpThum(String spThum) {
		this.spThum = spThum;
	}

	public String getSpBook() {
		return spBook;
	}

	public void setSpBook(String spBook) {
		this.spBook = spBook;
	}

	@Override
	public String toString() {
		return "SubProductVO [spId=" + spId + ", spProId=" + spProId + ", spLecName=" + spLecName + ", spThum=" + spThum
				+ ", spBook=" + spBook + "]";
	}
	
	
}
