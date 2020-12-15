package com.example.domain;

import java.sql.Date;

public class ClubVO extends CuVO{
	private String c_code;
	private String c_pid;
	private String c_welcome;
	private String c_condition;
	private String c_name;
	private String c_category;
	private String c_tag;
	private String c_pic;
	private String c_spot;
	private String c_pchk;
	private Date c_regdate;
	
	
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getC_pid() {
		return c_pid;
	}
	public void setC_pid(String c_pid) {
		this.c_pid = c_pid;
	}
	public String getC_welcome() {
		return c_welcome;
	}
	public void setC_welcome(String c_welcome) {
		this.c_welcome = c_welcome;
	}
	public String getC_condition() {
		return c_condition;
	}
	public void setC_condition(String c_condition) {
		this.c_condition = c_condition;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public String getC_tag() {
		return c_tag;
	}
	public void setC_tag(String c_tag) {
		this.c_tag = c_tag;
	}
	public String getC_pic() {
		return c_pic;
	}
	public void setC_pic(String c_pic) {
		this.c_pic = c_pic;
	}
	public String getC_spot() {
		return c_spot;
	}
	public void setC_spot(String c_spot) {
		this.c_spot = c_spot;
	}
	public String getC_pchk() {
		return c_pchk;
	}
	public void setC_pchk(String c_pchk) {
		this.c_pchk = c_pchk;
	}
	public Date getC_regdate() {
		return c_regdate;
	}
	public void setC_regDate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	@Override
	public String toString() {
		return "CirclesVO [c_code=" + c_code + ", c_pid=" + c_pid + ", c_welcome=" + c_welcome + ", c_condition="
				+ c_condition + ", c_name=" + c_name + ", c_category=" + c_category + ", c_tag=" + c_tag + ", c_pic="
				+ c_pic + ", c_spot=" + c_spot + ", c_pchk=" + c_pchk + ", c_regDate=" + c_regdate + "]";
	}
	
	
	
}
