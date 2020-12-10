package com.example.domain;

import java.sql.Date;

public class CnrVO {
   private int cnr_no;
   private int rn;
   private String c_code;
   private String id;
   private Date cnr_regdate;
   private String cnr_content;
   private int cn_no;
   
   @Override
   public String toString() {
      return "CnrVO [cnr_no=" + cnr_no + ", rn=" + rn + ", c_code=" + c_code + ", id=" + id + ", cnr_regdate="
            + cnr_regdate + ", cnr_content=" + cnr_content + ", cn_no=" + cn_no + "]";
   }
   public int getCn_no() {
      return cn_no;
   }
   public void setCn_no(int cn_no) {
      this.cn_no = cn_no;
   }
   public int getCnr_no() {
      return cnr_no;
   }
   public void setCnr_no(int cnr_no) {
      this.cnr_no = cnr_no;
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
   public Date getCnr_regdate() {
      return cnr_regdate;
   }
   public void setCnr_regdate(Date cnr_regdate) {
      this.cnr_regdate = cnr_regdate;
   }
   public String getCnr_content() {
      return cnr_content;
   }
   public void setCnr_content(String cnr_content) {
      this.cnr_content = cnr_content;
   }
}