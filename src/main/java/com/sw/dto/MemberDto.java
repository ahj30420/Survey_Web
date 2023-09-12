package com.sw.dto;

import java.sql.Date;

public class MemberDto {

	int ind;
	String id;
	String pw;
	String name;
	int phone;
	String email;
	String role;
	int point;
	Date redate;
	
	public MemberDto() {}
	
	public MemberDto(int ind, String id, String pw, String name, int phone, String email, String role, int point, Date redate) {
		this.ind=ind;
		this.id=id;
		this.pw=pw;
		this.name=name;
		this.phone=phone;
		this.email=email;
		this.role=role;
		this.point=point;
		this.redate=redate;
	}
	
	public int getInd() {
		return ind;
	}
	public void setInd(int ind) {
		this.ind = ind;
	}
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
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	
}
