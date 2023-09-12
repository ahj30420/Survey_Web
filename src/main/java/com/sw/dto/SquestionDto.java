package com.sw.dto;

public class SquestionDto {
	int sind;
	int numques;
	String question;
	int numselect;
	String conselect;
	
	public SquestionDto() {}
	public SquestionDto(int sind, int numques, String question, int numselect, String conselect) {
		this.sind = sind;
		this.numques = numques;
		this.question = question;
		this.numselect = numselect;
		this.conselect = conselect;
	}
	
	public int getSind() {
		return sind;
	}
	public void setSind(int sind) {
		this.sind = sind;
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
}
