package com.sw.dto;

import java.sql.Date;

public class SurveyDto {
	
	int ind;
	String title;
	String stitle;
	String img;
	Date redate;
	Date deadline;
	int point;
	
	public SurveyDto() {}
	
	public SurveyDto(int ind, String title, String stitle, String img, Date redate, Date deadline, int point) {
			this.ind=ind;
			this.title=title;
			this.stitle=stitle;
			this.img=img;
			this.redate=redate;
			this.deadline=deadline;
			this.point=point;
	}

	public int getInd() {
		return ind;
	}

	public void setInd(int ind) {
		this.ind = ind;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getRedate() {
		return redate;
	}

	public void setRedate(Date redate) {
		this.redate = redate;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
