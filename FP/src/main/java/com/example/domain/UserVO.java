package com.example.domain;

public class UserVO extends GuVO{
	private String id;
	private String pw;
	private String name;
	private String birthday;
	private String phone;
	private String addr;
	private String addrDetail;
	private String email;
	private String gender;
	private String u_keyword;
	private String image;
	private int uno;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getU_keyword() {
		return u_keyword;
	}
	public void setU_keyword(String u_keyword) {
		this.u_keyword = u_keyword;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pw=" + pw + ", name=" + name + ", birthday=" + birthday + ", phone=" + phone
				+ ", addr=" + addr + ", addrDetail=" + addrDetail + ", email=" + email + ", gender=" + gender
				+ ", keyword=" + u_keyword + ", image=" + image + ", uno=" + uno + "]";
	}
	
	
}
