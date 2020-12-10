package com.example.domain;

public class GuVO extends GroupVO{
   private String id;
   private int g_code;
   private String gu_pwchk;
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getG_code() {
      return g_code;
   }
   public void setG_code(int g_code) {
      this.g_code = g_code;
   }
   public String getGu_pwchk() {
      return gu_pwchk;
   }
   public void setGu_pwchk(String gu_pwchk) {
      this.gu_pwchk = gu_pwchk;
   }
   @Override
   public String toString() {
      return "GuVO [id=" + id + ", g_code=" + g_code + ", gu_pwchk=" + gu_pwchk + "]";
   }
}