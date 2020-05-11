package com.it.wecodeyou.search.model;

import com.it.wecodeyou.commons.PageVO;

public class SearchVO extends PageVO {
	
	private String q;
	private String condition;
	private String productType;
	
	public SearchVO(String q, String condition, String productType) {
		super();
		this.q = "";
		this.condition = "";
		this.productType = productType;
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}
	

	
	
}

