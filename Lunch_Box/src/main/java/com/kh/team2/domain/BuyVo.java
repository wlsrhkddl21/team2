package com.kh.team2.domain;

public class BuyVo {
	int buy_num;
	int pdt_num;
	String buy_date;
	String buy_address;
	int buy_price;
	String mem_id;
	int buy_count;
	String buy_tel;
	
	
	public BuyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BuyVo(int buy_num, int pdt_num, String buy_date, String buy_address, int buy_price, String mem_id,
			int buy_count, String buy_tel) {
		super();
		this.buy_num = buy_num;
		this.pdt_num = pdt_num;
		this.buy_date = buy_date;
		this.buy_address = buy_address;
		this.buy_price = buy_price;
		this.mem_id = mem_id;
		this.buy_count = buy_count;
		this.buy_tel = buy_tel;
	}
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}
	public int getPdt_num() {
		return pdt_num;
	}
	public void setPdt_num(int pdt_num) {
		this.pdt_num = pdt_num;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_address() {
		return buy_address;
	}
	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public String getBuy_tel() {
		return buy_tel;
	}
	public void setBuy_tel(String buy_tel) {
		this.buy_tel = buy_tel;
	}
	@Override
	public String toString() {
		return "BuyVo [buy_num=" + buy_num + ", pdt_num=" + pdt_num + ", buy_date=" + buy_date + ", buy_address="
				+ buy_address + ", buy_price=" + buy_price + ", mem_id=" + mem_id + ", buy_count=" + buy_count
				+ ", buy_tel=" + buy_tel + "]";
	}
	
	
}
