package com.sw.dto;

public class AnsurveyDto {

	int sind;
	String title;
	int psnum;
	
	public AnsurveyDto() {}
	public AnsurveyDto(int sind, String title, int psnum) {
		this.sind = sind;
		this.title = title;
		this.psnum = psnum;
	}
	
	public int getSind() {
		return sind;
	}
	public void setSind(int sind) {
		this.sind = sind;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPsnum() {
		return psnum;
	}
	public void setPsnum(int psnum) {
		this.psnum = psnum;
	}
	
}
