package com.kh.team2.domain;

public class MyLunchVo {
	private int lunch_num;
	private String lunch_type;
	private String lunch_name;
	private int lunch_price;
	public MyLunchVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getLunch_num() {
		return lunch_num;
	}
	public void setLunch_num(int lunch_num) {
		this.lunch_num = lunch_num;
	}
	public String getLunch_type() {
		return lunch_type;
	}
	public void setLunch_type(String lunch_type) {
		this.lunch_type = lunch_type;
	}
	public String getLunch_name() {
		return lunch_name;
	}
	public void setLunch_name(String lunch_name) {
		this.lunch_name = lunch_name;
	}
	public int getLunch_price() {
		return lunch_price;
	}
	public void setLunch_price(int lunch_price) {
		this.lunch_price = lunch_price;
	}
	@Override
	public String toString() {
		return "MyLunchVo [lunch_num=" + lunch_num + ", lunch_type=" + lunch_type + ", lunch_name=" + lunch_name
				+ ", lunch_price=" + lunch_price + "]";
	}
	
	
}
