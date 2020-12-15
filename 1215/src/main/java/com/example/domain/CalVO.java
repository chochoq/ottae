package com.example.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalVO extends GuVO {
	private int calno;
	private String username;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone ="Asia/Seoul")
	private Date start;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm",timezone ="Asia/Seoul")
	private Date end;
	private String title;
	private String description;
	private String type;
	private String backgroundColor;
	private String textColor;
	private String allDay;
	private String schk;
	
	

	public String getSchk() {
		return schk;
	}
	public void setSchk(String schk) {
		this.schk = schk;
	}
	public int getCalno() {
		return calno;
	}
	public void setCalno(int calno) {
		this.calno = calno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	@Override
	public String toString() {
		return "CalVO [calno=" + calno + ", username=" + username + ", start=" + start + ", end=" + end + ", title="
				+ title + ", description=" + description + ", type=" + type + ", backgroundColor=" + backgroundColor
				+ ", textColor=" + textColor + ", allDay=" + allDay + ", schk=" + schk + "]";
	}

	
	
}
