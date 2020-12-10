package com.example.domain;

import java.util.Date;

public class NoticeVO {
   private int n_no;
   private String id;
   private String n_title;
   private Date n_regdate;
   private String n_content;
   	public int getN_no() {
	   return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

   

   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getN_title() {
      return n_title;
   }
   public void setN_title(String n_title) {
      this.n_title = n_title;
   }
   public Date getN_regdate() {
      return n_regdate;
   }
   public void setN_regdate(Date n_regdate) {
      this.n_regdate = n_regdate;
   }
   public String getN_content() {
      return n_content;
   }
   public void setN_content(String n_content) {
      this.n_content = n_content;
   }
   @Override
   public String toString() {
      return "NoticeVO [n_no=" + n_no + ", id=" + id + ", n_title=" + n_title + ", n_regdate=" + n_regdate
            + ", n_content=" + n_content + "]";
   }
   
   
   
}