package com.kh.team2.domain;

public class MemberVo {
	private String mem_name;
	private String mem_id;
	private String mem_pass;
	private String mem_address;
	private String mem_tel;
	private int mem_point;
	
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
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
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	@Override
	public String toString() {
		return "MemberVo [mem_name=" + mem_name + ", mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_address="
				+ mem_address + ", mem_tel=" + mem_tel + ", mem_point=" + mem_point + "]";
	}
	
	
}
