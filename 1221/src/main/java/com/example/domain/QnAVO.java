package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnAVO {
	   private int q_no;
	   private String id;
	   private String q_title;
	   @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone ="Asia/Seoul")
	    private Date replyDate;
	   @JsonFormat(pattern="yyyy-MM-dd",timezone ="Asia/Seoul")
	   private Date q_regdate;
	   private String q_content;
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public Date getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	@Override
	public String toString() {
		return "QnAVO [q_no=" + q_no + ", id=" + id + ", q_title=" + q_title + ", q_regdate=" + q_regdate
				+ ", q_content=" + q_content + "]";
	}
	   
	   
}
