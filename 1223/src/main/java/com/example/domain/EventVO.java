package com.example.domain;



import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EventVO{
	public int e_no;
	public String id;
	public String e_title;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone ="Asia/Seoul")
    private Date replyDate;
	@JsonFormat(pattern="yyyy-MM-dd",timezone ="Asia/Seoul")
	public Date e_regdate;
	public String e_content;
	
	public int getE_no() {
		return e_no;
	}
	public void setE_no(int e_no) {
		this.e_no = e_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getE_title() {
		return e_title;
	}
	public void setE_title(String e_title) {
		this.e_title = e_title;
	}
	public Date getE_regdate() {
		return e_regdate;
	}
	public void setE_regdate(Date e_regdate) {
		this.e_regdate = e_regdate;
	}
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	@Override
	public String toString() {
		return "EventVO [eno=" + e_no + ", id=" + id + ", e_title=" + e_title + ", e_regdate=" + e_regdate
				+ ", e_content=" + e_content + "]";
	}
	
	
}
