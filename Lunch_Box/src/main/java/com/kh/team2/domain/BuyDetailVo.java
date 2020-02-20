package com.kh.team2.domain;

public class BuyDetailVo {
	//구매 상품 보기
	private int buy_num;
	private int pdt_num;
	private int buy_count;
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
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	@Override
	public String toString() {
		return "BuyDetailVo [buy_num=" + buy_num + ", pdt_num=" + pdt_num + ", buy_count=" + buy_count + "]";
	}
	
	
}
