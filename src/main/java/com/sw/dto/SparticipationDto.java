package com.sw.dto;

import java.sql.Date;

public class SparticipationDto {
	
	int mind;
	int sind;
	int numques;
	int numselect;
	Date pdate;
	
	public SparticipationDto(){}
	public SparticipationDto(int mind, int sind, int numques, int numselect, Date pdate){
		this.mind = mind;
		this.sind = sind;
		this.numques = numques;
		this.numselect = numselect;
		this.pdate = pdate;
	}
	
	public int getMind() {
		return mind;
	}
	public void setMind(int mind) {
		this.mind = mind;
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
	public int getNumselect() {
		return numselect;
	}
	public void setNumselect(int numselect) {
		this.numselect = numselect;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
}
