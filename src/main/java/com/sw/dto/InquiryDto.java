package com.sw.dto;

import java.sql.Date;

public class InquiryDto {
	
	int iqind;
	int mind;
	Date redate;
	String coninquiry;
	int ansmind;
	Date ansdate;
	String conanswer;
	String status;
	
	public InquiryDto() {}
	public InquiryDto(int iqind, int mind, Date redate, String coninquiry, int ansmind, Date ansdate, String conanswer, String status) {
		this.iqind = iqind;
		this.mind = mind;
		this.redate = redate;
		this.coninquiry = coninquiry;
		this.ansmind = ansmind;
		this.ansdate = ansdate;
		this.conanswer = conanswer;
		this.status = status;
	}
	public int getIqind() {
		return iqind;
	}
	public void setIqind(int iqind) {
		this.iqind = iqind;
	}
	public int getMind() {
		return mind;
	}
	public void setMind(int mind) {
		this.mind = mind;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public String getConinquiry() {
		return coninquiry;
	}
	public void setConinquiry(String coninquiry) {
		this.coninquiry = coninquiry;
	}
	public int getAnsmind() {
		return ansmind;
	}
	public void setAnsmind(int ansmind) {
		this.ansmind = ansmind;
	}
	public Date getAnsdate() {
		return ansdate;
	}
	public void setAnsdate(Date ansdate) {
		this.ansdate = ansdate;
	}
	public String getConanswer() {
		return conanswer;
	}
	public void setConanswer(String conanswer) {
		this.conanswer = conanswer;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
