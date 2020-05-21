package com.it.wecodeyou.off.model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class OffCourseVO {
	private String type;
	private String name;
	private Integer price;
	private String detail;
	private String thumb;
	private String author;
	private Integer seats;
	private String place;
	private String room;
	private String book;
	private Timestamp offStartAt;
	private Timestamp offEndAt;
	private ArrayList<Integer> sendTagList;
	
	public OffCourseVO() {
		super();
	}

	public OffCourseVO( String type, String name, Integer price, String detail, String thumb,
			String author, Integer seats, String place, String room, String book, Timestamp offStartAt,
			Timestamp offEndAt, ArrayList<Integer> sendTagList) {
		super();
		this.type = type;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.thumb = thumb;
		this.author = author;
		this.seats = seats;
		this.place = place;
		this.room = room;
		this.book = book;
		this.offStartAt = offStartAt;
		this.offEndAt = offEndAt;
		this.sendTagList = sendTagList;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getSeats() {
		return seats;
	}

	public void setSeats(Integer seats) {
		this.seats = seats;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getBook() {
		return book;
	}

	public void setBook(String book) {
		this.book = book;
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

	public ArrayList<Integer> getSendTagList() {
		return sendTagList;
	}

	public void setSendTagList(ArrayList<Integer> sendTagList) {
		this.sendTagList = sendTagList;
	}

	@Override
	public String toString() {
		return "OffCourseVO [ type=" + type + ", name=" + name + ", price=" + price
				+ ", detail=" + detail + ", thumb=" + thumb + ", author=" + author + ", seats=" + seats + ", place="
				+ place + ", room=" + room + ", book=" + book + ", offStartAt=" + offStartAt + ", offEndAt=" + offEndAt
				+ ", sendTagList=" + sendTagList + "]";
	}

}
