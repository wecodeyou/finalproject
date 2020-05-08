package com.it.wecodeyou.search.model;

import com.it.wecodeyou.commons.PageVO;

public class SearchVO extends PageVO {
	
	private String q;
	private String condition;
	
	public SearchVO() {
		this.q = "";
		this.condition = "";
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
	
	
	
}

