package com.sw.dto;

public class QpselectDto {

	int qind;
	int numselect;
	String conselect;
	
	public QpselectDto() {}
	public QpselectDto(int qind, int numselect, String conselect) {
		this.qind = qind;
		this.numselect = numselect;
		this.conselect = conselect;
	}
	public int getQind() {
		return qind;
	}
	public void setQind(int qind) {
		this.qind = qind;
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
