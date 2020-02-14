package com.kh.team2.domain;

public class CartVo {
	private int pdt_num;
	private int cart_num;
	private String pdt_name;
	private int pdt_price;
	private int cart_count;
	private String mem_id;

	public CartVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartVo(int pdt_num, int cart_num, String pdt_name, int pdt_price, int cart_count, String mem_id) {
		super();
		this.pdt_num = pdt_num;
		this.cart_num = cart_num;
		this.pdt_name = pdt_name;
		this.pdt_price = pdt_price;
		this.cart_count = cart_count;
		this.mem_id = mem_id;
	}

	public int getPdt_num() {
		return pdt_num;
	}

	public void setPdt_num(int pdt_num) {
		this.pdt_num = pdt_num;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public String getPdt_name() {
		return pdt_name;
	}

	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}

	public int getPdt_price() {
		return pdt_price;
	}

	public void setPdt_price(int pdt_price) {
		this.pdt_price = pdt_price;
	}

	public int getCart_count() {
		return cart_count;
	}

	public void setCart_count(int cart_count) {
		this.cart_count = cart_count;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "CartVo [pdt_num=" + pdt_num + ", cart_num=" + cart_num + ", pdt_name=" + pdt_name + ", pdt_price="
				+ pdt_price + ", cart_count=" + cart_count + ", mem_id=" + mem_id + "]";
	}

}
