package com.sw.dto;

import java.sql.Date;

public class AnqpnumDto {
	
	int mind;
	String id;
	Date pdate;
	
	public AnqpnumDto(){}
	public AnqpnumDto(int mind, String id, Date pdate){
		this.mind = mind;
		this.id = id;
		this.pdate = pdate;
	}
	
	public int getMind() {
		return mind;
	}
	public void setMind(int mind) {
		this.mind = mind;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	
}
