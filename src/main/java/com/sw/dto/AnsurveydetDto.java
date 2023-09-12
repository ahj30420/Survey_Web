package com.sw.dto;

public class AnsurveydetDto {

	int numques;
	String question;
	int numselect;
	String conselect;
	int count;
	
	public AnsurveydetDto() {}
	public AnsurveydetDto(int numques, String question, int numselect, String conselect, int count) {
		this.numques = numques;
		this.question = question;
		this.numselect = numselect;
		this.conselect = conselect;
		this.count = count;
	}
	
	public int getNumques() {
		return numques;
	}
	public void setNumques(int numques) {
		this.numques = numques;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getNumselect() {
		return numselect;
	}
	public void setNumselect(int numselect) {
		this.numselect = numselect;
	}
	public String getConselect() {
		return conselect;
	}
	public void setConselect(String conselect) {
		this.conselect = conselect;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
