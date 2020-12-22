package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CbVO {
	private int cb_no;
	private String c_code;
	private String id;
	private String cb_title;
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone ="Asia/Seoul")
	private Date cb_regdate;
	private String cb_content;
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCb_title() {
		return cb_title;
	}
	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}
	public Date getCb_regdate() {
		return cb_regdate;
	}
	public void setCb_regdate(Date cb_regdate) {
		this.cb_regdate = cb_regdate;
	}
	public String getCb_content() {
		return cb_content;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	@Override
	public String toString() {
		return "CbVO [cb_no=" + cb_no + ", c_code=" + c_code + ", id=" + id + ", cb_title=" + cb_title + ", cb_regdate="
				+ cb_regdate + ", cb_content=" + cb_content + "]";
	}
}
