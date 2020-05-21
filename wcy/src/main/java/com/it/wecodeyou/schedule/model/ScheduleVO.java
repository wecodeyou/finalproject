package com.it.wecodeyou.schedule.model;

import java.sql.Timestamp;

public class ScheduleVO {

	private Integer scheduleNo;
	private Integer scheduleOffNo;
	private Integer scheduleRowNo;
	private String scheduleTitle;
	private Timestamp scheduleStartDate;
	private Timestamp scheduleEndDate;
	private String scheduleDetail;
	private String scheduleBgColor;
	
	
	public ScheduleVO() {}


	public ScheduleVO(Integer scheduleNo, Integer scheduleOffNo, Integer scheduleRowNo, String scheduleTitle,
			Timestamp scheduleStartDate, Timestamp scheduleEndDate, String scheduleDetail, String scheduleBgColor) {
		super();
		this.scheduleNo = scheduleNo;
		this.scheduleOffNo = scheduleOffNo;
		this.scheduleRowNo = scheduleRowNo;
		this.scheduleTitle = scheduleTitle;
		this.scheduleStartDate = scheduleStartDate;
		this.scheduleEndDate = scheduleEndDate;
		this.scheduleDetail = scheduleDetail;
		this.scheduleBgColor = scheduleBgColor;
	}


	public Integer getScheduleNo() {
		return scheduleNo;
	}


	public void setScheduleNo(Integer scheduleNo) {
		this.scheduleNo = scheduleNo;
	}


	public Integer getScheduleOffNo() {
		return scheduleOffNo;
	}


	public void setScheduleOffNo(Integer scheduleOffNo) {
		this.scheduleOffNo = scheduleOffNo;
	}


	public Integer getScheduleRowNo() {
		return scheduleRowNo;
	}


	public void setScheduleRowNo(Integer scheduleRowNo) {
		this.scheduleRowNo = scheduleRowNo;
	}


	public String getScheduleTitle() {
		return scheduleTitle;
	}


	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}


	public Timestamp getScheduleStartDate() {
		return scheduleStartDate;
	}


	public void setScheduleStartDate(Timestamp scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}


	public Timestamp getScheduleEndDate() {
		return scheduleEndDate;
	}


	public void setScheduleEndDate(Timestamp scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}


	public String getScheduleDetail() {
		return scheduleDetail;
	}


	public void setScheduleDetail(String scheduleDetail) {
		this.scheduleDetail = scheduleDetail;
	}


	public String getScheduleBgColor() {
		return scheduleBgColor;
	}


	public void setScheduleBgColor(String scheduleBgColor) {
		this.scheduleBgColor = scheduleBgColor;
	}


	@Override
	public String toString() {
		return "ScheduleVO [scheduleNo=" + scheduleNo + ", scheduleOffNo=" + scheduleOffNo + ", scheduleRowNo="
				+ scheduleRowNo + ", scheduleTitle=" + scheduleTitle + ", scheduleStartDate=" + scheduleStartDate
				+ ", scheduleEndDate=" + scheduleEndDate + ", scheduleDetail=" + scheduleDetail + ", scheduleBgColor="
				+ scheduleBgColor + "]";
	}
	
	
	
	
}
