package com.it.wecodeyou.on.model;

import java.util.ArrayList;

public class OnCourseVO {
	private String name;
	private Integer price;
	private String detail;
	private String thumb;
	private String author;
	private String book;
	private String category;
	private Integer days;
	private ArrayList<Integer> sendTagList;
	public OnCourseVO() {
		super();
	}
	public OnCourseVO(String name, Integer price, String detail, String thumb, String author, String book,
			String category, Integer days, ArrayList<Integer> sendTagList) {
		super();
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.thumb = thumb;
		this.author = author;
		this.book = book;
		this.category = category;
		this.days = days;
		this.sendTagList = sendTagList;
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
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getDays() {
		return days;
	}
	public void setDays(Integer days) {
		this.days = days;
	}
	public ArrayList<Integer> getSendTagList() {
		return sendTagList;
	}
	public void setSendTagList(ArrayList<Integer> sendTagList) {
		this.sendTagList = sendTagList;
	}
	@Override
	public String toString() {
		return "OnCourseVO [name=" + name + ", price=" + price + ", detail=" + detail + ", thumb=" + thumb + ", author="
				+ author + ", book=" + book + ", category=" + category + ", days=" + days + ", sendTagList="
				+ sendTagList + "]";
	}
	
	
}
