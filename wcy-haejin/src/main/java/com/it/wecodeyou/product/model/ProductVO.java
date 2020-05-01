package com.it.wecodeyou.product.model;

import java.sql.Timestamp;

public class ProductVO {
	private long productNo;
	private String productType;
	private String productName;
	private Integer productPrice;
	private String productDetail;
	private Timestamp productCreatedAt;
	private String productThumb;
	
	public ProductVO() {}

	public ProductVO(long productNo, String productType, String productName, Integer productPrice, String productDetail,
			Timestamp productCreatedAt, String productThumb) {
		super();
		this.productNo = productNo;
		this.productType = productType;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDetail = productDetail;
		this.productCreatedAt = productCreatedAt;
		this.productThumb = productThumb;
	}

	public ProductVO(String productType, String productName, Integer productPrice, String productDetail,
			String productThumb) {
		super();
		this.productType = productType;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDetail = productDetail;
		this.productThumb = productThumb;
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

	public String getProductThumb() {
		return productThumb;
	}

	public void setProductThumb(String productThumb) {
		this.productThumb = productThumb;
	}
	
	
	public long getProductNo() {
		return productNo;
	}

	public void setProductNo(long productNo) {
		this.productNo = productNo;
	}

	public Timestamp getProductCreatedAt() {
		return productCreatedAt;
	}

	public void setProductCreatedAt(Timestamp productCreatedAt) {
		this.productCreatedAt = productCreatedAt;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productType=" + productType + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productDetail=" + productDetail + ", productCreatedAt="
				+ productCreatedAt + ", productThumb=" + productThumb + "]";
	}
	
	
}
