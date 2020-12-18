package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CnVO {
   
   private int cn_no;
   private String c_code;
   private String id;
   private String cn_title;
   @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss",timezone ="Asia/Seoul")
   private Date cn_regdate;
   private String cn_content;
   private int cn_bold;
   private int cn_rchk;
   public int getCn_no() {
      return cn_no;
   }
   public void setCn_no(int cn_no) {
      this.cn_no = cn_no;
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
   public String getCn_title() {
      return cn_title;
   }
   public void setCn_title(String cn_title) {
      this.cn_title = cn_title;
   }
   public Date getCn_regdate() {
      return cn_regdate;
   }
   public void setCn_regdate(Date cn_regdate) {
      this.cn_regdate = cn_regdate;
   }
   public String getCn_content() {
      return cn_content;
   }
   public void setCn_content(String cn_content) {
      this.cn_content = cn_content;
   }
   public int getCn_bold() {
      return cn_bold;
   }
   public void setCn_bold(int cn_bold) {
      this.cn_bold = cn_bold;
   }
   public int getCn_rchk() {
      return cn_rchk;
   }
   public void setCn_rchk(int cn_rchk) {
      this.cn_rchk = cn_rchk;
   }
   @Override
   public String toString() {
      return "CnVO [cn_no=" + cn_no + ", c_code=" + c_code + ", id=" + id + ", cn_title=" + cn_title + ", cn_regdate="
            + cn_regdate + ", cn_content=" + cn_content + ", cn_bold=" + cn_bold + ", cn_rchk=" + cn_rchk + "]";
   }
   

   
}