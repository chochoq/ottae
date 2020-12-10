package com.example.domain;

import java.sql.Date;

public class GroupVO {
   private int g_code;
   private String g_name;
   private String g_pic;
   private String g_pass;
   private Date g_regDate;
public int getG_code() {
	return g_code;
}
public void setG_code(int g_code) {
	this.g_code = g_code;
}
public String getG_name() {
	return g_name;
}
public void setG_name(String g_name) {
	this.g_name = g_name;
}
public String getG_pic() {
	return g_pic;
}
public void setG_pic(String g_pic) {
	this.g_pic = g_pic;
}
public String getG_pass() {
	return g_pass;
}
public void setG_pass(String g_pass) {
	this.g_pass = g_pass;
}
public Date getG_regDate() {
	return g_regDate;
}
public void setG_regDate(Date g_regDate) {
	this.g_regDate = g_regDate;
}
@Override
public String toString() {
	return "GroupVO [g_code=" + g_code + ", g_name=" + g_name + ", g_pic=" + g_pic + ", g_pass=" + g_pass
			+ ", g_regDate=" + g_regDate + "]";
}


   
}
