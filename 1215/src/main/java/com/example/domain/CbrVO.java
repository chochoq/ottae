package com.example.domain;

import java.sql.Date;

public class CbrVO {
	private int cbr_no;
	private int rn;
	private String c_code;
	private String id;
	private Date cbr_regdate;
	private String cbr_content;
	private int cb_no;
	
	public int getCbr_no() {
		return cbr_no;
	}
	public void setCbr_no(int cbr_no) {
		this.cbr_no = cbr_no;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
	public Date getCbr_regdate() {
		return cbr_regdate;
	}
	public void setCbr_regdate(Date cbr_regdate) {
		this.cbr_regdate = cbr_regdate;
	}
	public String getCbr_content() {
		return cbr_content;
	}
	public void setCbr_content(String cbr_content) {
		this.cbr_content = cbr_content;
	}
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	@Override
	public String toString() {
		return "CbrVO [cbr_no=" + cbr_no + ", rn=" + rn + ", c_code=" + c_code + ", id=" + id + ", cbr_regdate="
				+ cbr_regdate + ", cbr_content=" + cbr_content + ", cb_no=" + cb_no + "]";
	}
	   
}
