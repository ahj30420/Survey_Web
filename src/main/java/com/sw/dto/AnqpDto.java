package com.sw.dto;

public class AnqpDto {
	
	int qind;
	String question;
	int count;
	
	public AnqpDto() {}
	public AnqpDto(int qind, String question, int count) {
		this.qind = qind;
		this.question = question;
		this.count = count;
	}
	
	public int getQind() {
		return qind;
	}
	public void setQind(int qind) {
		this.qind = qind;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}
