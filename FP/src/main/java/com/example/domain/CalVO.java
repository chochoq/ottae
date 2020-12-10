package com.example.domain;

import java.sql.Date;

public class CalVO {
	private int cal_no;
	private String id;
	private String cal_title;
	private Date cal_sdate;
	private Date cal_edate;
	private String cal_content;
	private String cal_place;
	private String cal_schk;
	private String cal_sdchk;
	private String cal_stime;
	private String cal_etime;
	public int getCal_no() {
		return cal_no;
	}
	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public Date getCal_sdate() {
		return cal_sdate;
	}
	public void setCal_sdate(Date cal_sdate) {
		this.cal_sdate = cal_sdate;
	}
	public Date getCal_edate() {
		return cal_edate;
	}
	public void setCal_edate(Date cal_edate) {
		this.cal_edate = cal_edate;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public String getCal_place() {
		return cal_place;
	}
	public void setCal_place(String cal_place) {
		this.cal_place = cal_place;
	}
	public String getCal_schk() {
		return cal_schk;
	}
	public void setCal_schk(String cal_schk) {
		this.cal_schk = cal_schk;
	}
	public String getCal_sdchk() {
		return cal_sdchk;
	}
	public void setCal_sdchk(String cal_sdchk) {
		this.cal_sdchk = cal_sdchk;
	}
	public String getCal_stime() {
		return cal_stime;
	}
	public void setCal_stime(String cal_stime) {
		this.cal_stime = cal_stime;
	}
	public String getCal_etime() {
		return cal_etime;
	}
	public void setCal_etime(String cal_etime) {
		this.cal_etime = cal_etime;
	}
	@Override
	public String toString() {
		return "CalVO [cal_no=" + cal_no + ", id=" + id + ", cal_title=" + cal_title + ", cal_sdate=" + cal_sdate
				+ ", cal_edate=" + cal_edate + ", cal_content=" + cal_content + ", cal_place=" + cal_place
				+ ", cal_schk=" + cal_schk + ", cal_sdchk=" + cal_sdchk + ", cal_stime=" + cal_stime + ", cal_etime="
				+ cal_etime + "]";
	}
	
	
	
	
}
