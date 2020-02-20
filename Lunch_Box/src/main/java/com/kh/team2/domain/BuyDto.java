package com.kh.team2.domain;

//상품 정보 가져오려고 
public class BuyDto {
	
	private int pdt_num;
	private int buy_count;
	private int pdt_price;
	private String pdt_name; //나만의 도시락 나.도(잡곡밥,반찬,국)

	public int getPdt_num() {
		return pdt_num;
	}

	public void setPdt_num(int pdt_num) {
		this.pdt_num = pdt_num;
	}

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
		return "BuyDto [pdt_num=" + pdt_num + ", buy_count=" + buy_count + ", pdt_price=" + pdt_price + ", pdt_name="
				+ pdt_name 
				+ "]";
	}


}
