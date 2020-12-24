package com.example.domain;

public class CuVO extends UserVO{
	
	private String c_code;
	private char cu_pchk;
	private char cu_schk;
	private char cu_fchk;
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public char getCu_pchk() {
		return cu_pchk;
	}
	public void setCu_pchk(char cu_pchk) {
		this.cu_pchk = cu_pchk;
	}
	public char getCu_schk() {
		return cu_schk;
	}
	public void setCu_schk(char cu_schk) {
		this.cu_schk = cu_schk;
	}
	public char getCu_fchk() {
		return cu_fchk;
	}
	public void setCu_fchk(char cu_fchk) {
		this.cu_fchk = cu_fchk;
	}
	@Override
	public String toString() {
		return "CuVO [c_code=" + c_code + ", cu_pchk=" + cu_pchk + ", cu_schk=" + cu_schk + ", cu_fchk=" + cu_fchk
				+ "]";
	}
}
