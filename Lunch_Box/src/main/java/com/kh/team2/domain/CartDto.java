package com.kh.team2.domain;

import java.util.Arrays;

public class CartDto {
	private int[] pdt_num;
	private int[] buy_count;
	
	public int[] getPdt_num() {
		return pdt_num;
	}

	public void setPdt_num(int[] pdt_num) {
		this.pdt_num = pdt_num;
	}

	public int[] getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int[] buy_count) {
		this.buy_count = buy_count;
	}

	@Override
	public String toString() {
		return "cartDto [pdt_num=" + Arrays.toString(pdt_num) + ", buy_count=" + Arrays.toString(buy_count) + "]";
	}
	
	
	
}
