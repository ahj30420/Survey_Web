package com.sw.dto;

public class QpcpcountDto {

	int qind;
	int selection;
	int count;
	
	public QpcpcountDto() {}
	public QpcpcountDto(int qind, int selection, int count) {
		this.qind = qind;
		this.selection = selection;
		this.count = count;
	}
	public int getQind() {
		return qind;
	}
	public void setQind(int qind) {
		this.qind = qind;
	}
	public int getSelection() {
		return selection;
	}
	public void setSelection(int selection) {
		this.selection = selection;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
