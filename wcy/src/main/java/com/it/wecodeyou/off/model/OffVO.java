package com.it.wecodeyou.off.model;

import java.sql.Timestamp;

public class OffVO {
	private Integer offNo;
	private String offAuthor;
	private String offCategory;
	private Integer offProductNo;
	private String offPlace;
	private String offRoom;
	private String offUploadUri;
	private Integer offSeats;
	private Timestamp offStartAt;
	private Timestamp offEndAt;
	private Timestamp offCreatedAt;
	private Timestamp offModifiedAt;
	
	public OffVO() {}

	
	public OffVO(Integer offNo, String offAuthor, String offCategory, Integer offProductNo, String offPlace,
			String offUploadUri, Integer offSeats, Timestamp offStartAt, Timestamp offEndAt, Timestamp offCreatedAt,
			Timestamp offModifiedAt, String offRoom) {
		super();
		this.offNo = offNo;
		this.offAuthor = offAuthor;
		this.offCategory = offCategory;
		this.offProductNo = offProductNo;
		this.offPlace = offPlace;
		this.offRoom = offRoom;
		this.offUploadUri = offUploadUri;
		this.offSeats = offSeats;
		this.offStartAt = offStartAt;
		this.offEndAt = offEndAt;
		this.offCreatedAt = offCreatedAt;
		this.offModifiedAt = offModifiedAt;
		this.offRoom = offRoom;
	}


	public Integer getOffNo() {
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

	public Integer getOffProductNo() {
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

	public String getOffRoom() {
		return offRoom;
	}

	public void setOffRoom(String offRoom) {
		this.offRoom = offRoom;
	}


	@Override
	public String toString() {
		return "OffVO [offNo=" + offNo + ", offAuthor=" + offAuthor + ", offCategory=" + offCategory + ", offProductNo="
				+ offProductNo + ", offPlace=" + offPlace + ", offRoom=" + offRoom + ", offUploadUri=" + offUploadUri
				+ ", offSeats=" + offSeats + ", offStartAt=" + offStartAt + ", offEndAt=" + offEndAt + ", offCreatedAt="
				+ offCreatedAt + ", offModifiedAt=" + offModifiedAt + "]";
	}


	
}
