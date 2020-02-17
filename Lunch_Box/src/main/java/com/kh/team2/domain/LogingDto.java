package com.kh.team2.domain;

public class LogingDto {
	private String mem_id;
	private String mem_pass;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	@Override
	public String toString() {
		return "LogingDto [mem_id=" + mem_id + ", mem_pass=" + mem_pass + "]";
	}
	
	
	
	
}
