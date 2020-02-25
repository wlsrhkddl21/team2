package com.kh.team2.domain;

public class BuyMyVo {
	private int buy_num;
	private int rice;
	private int soup;
	private int side1;
	private int side2;
	private int side3;
	private int buy_price;
	private int buy_count;
	private String buy_name;
	private String mem_id;
	private String buy_address;
	private String buy_tel;
	private String buy_date;
	

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public String getBuy_tel() {
		return buy_tel;
	}

	public void setBuy_tel(String buy_tel) {
		this.buy_tel = buy_tel;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public int getRice() {
		return rice;
	}

	public void setRice(int rice) {
		this.rice = rice;
	}

	public int getSoup() {
		return soup;
	}

	public void setSoup(int soup) {
		this.soup = soup;
	}

	public int getSide1() {
		return side1;
	}

	public void setSide1(int side1) {
		this.side1 = side1;
	}

	public int getSide2() {
		return side2;
	}

	public void setSide2(int side2) {
		this.side2 = side2;
	}

	public int getSide3() {
		return side3;
	}

	public void setSide3(int side3) {
		this.side3 = side3;
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

	public String getBuy_name() {
		return buy_name;
	}

	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}

	@Override
	public String toString() {
		return "BuyMyVo [buy_num=" + buy_num + ", rice=" + rice + ", soup=" + soup + ", side1=" + side1 + ", side2="
				+ side2 + ", side3=" + side3 + ", buy_price=" + buy_price + ", buy_count=" + buy_count + ", buy_name="
				+ buy_name + ", mem_id=" + mem_id + ", buy_address=" + buy_address + ", buy_tel=" + buy_tel
				+ ", buy_date=" + buy_date + "]";
	}


}
