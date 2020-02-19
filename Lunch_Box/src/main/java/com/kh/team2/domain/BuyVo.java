package com.kh.team2.domain;

public class BuyVo {
	private int buy_num;
	private String mem_id;
	
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "BuyVo [buy_num=" + buy_num + ", mem_id=" + mem_id + "]";
	}
	
}

