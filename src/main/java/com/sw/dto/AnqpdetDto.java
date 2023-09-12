package com.sw.dto;

public class AnqpdetDto {

	int numselect;
	String conselect;
	int count;
	
	public AnqpdetDto() {}
	public AnqpdetDto(int numselect, String conselect, int count) {
		this.numselect = numselect;
		this.conselect = conselect;
		this.count = count;
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
