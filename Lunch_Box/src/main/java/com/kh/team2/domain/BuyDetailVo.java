package com.kh.team2.domain;

public class BuyDetailVo {
	private int buy_num;
	private int pdt_num;
	private String buy_date;
	private String buy_address;
	private int buy_price; // 상품가격 * 갯수
	private int buy_count;
	private String buy_tel;
	
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
		return "BuyDetailVo [buy_num=" + buy_num + ", pdt_num=" + pdt_num + ", buy_date=" + buy_date + ", buy_address="
				+ buy_address + ", buy_price=" + buy_price + ", buy_count=" + buy_count + ", buy_tel=" + buy_tel + "]";
	}
	
}
