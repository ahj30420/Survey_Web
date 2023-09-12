package com.sw.dto;

import java.sql.Date;

public class QpDto {

	int qind;
	int mind;
	String question;
	String image;
	Date redate;
	Date deadline;
	
	public QpDto() {}
	public QpDto(int qind, int mind, String question, String image, Date redate, Date deadline) {
		this.qind = qind;
		this.mind = mind;
		this.question = question;
		this.image = image;
		this.redate = redate;
		this.deadline = deadline;
	}
	public int getQind() {
		return qind;
	}
	public void setQind(int qind) {
		this.qind = qind;
	}
	public int getMind() {
		return mind;
	}
	public void setMind(int mind) {
		this.mind = mind;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
}
