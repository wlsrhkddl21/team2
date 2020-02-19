package com.kh.team2.domain;

//상품 정보 가져오려고 
public class BuyDto {
	private int buy_count;
	private int pdt_price;
	private String pdt_name;

	public int getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}

	public int getPdt_price() {
		return pdt_price;
	}

	public void setPdt_price(int pdt_price) {
		this.pdt_price = pdt_price;
	}

	public String getPdt_name() {
		return pdt_name;
	}

	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

}
