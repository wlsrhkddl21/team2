package com.kh.team2.domain;

public class ProductVo {
	private int pdt_num;
	private String pdt_category;
	private String pdt_name;
	private int pdt_date;
	private int pdt_price;
	private String pdt_image;
	private int pdt_sales;
	public ProductVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductVo(int pdt_num, String pdt_category, String pdt_name, int pdt_date, int pdt_price, String pdt_image,
			int pdt_sales) {
		super();
		this.pdt_num = pdt_num;
		this.pdt_category = pdt_category;
		this.pdt_name = pdt_name;
		this.pdt_date = pdt_date;
		this.pdt_price = pdt_price;
		this.pdt_image = pdt_image;
		this.pdt_sales = pdt_sales;
	}
	public int getPdt_num() {
		return pdt_num;
	}
	public void setPdt_num(int pdt_num) {
		this.pdt_num = pdt_num;
	}
	public String getPdt_category() {
		return pdt_category;
	}
	public void setPdt_category(String pdt_category) {
		this.pdt_category = pdt_category;
	}
	public String getPdt_name() {
		return pdt_name;
	}
	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}
	public int getPdt_date() {
		return pdt_date;
	}
	public void setPdt_date(int pdt_date) {
		this.pdt_date = pdt_date;
	}
	public int getPdt_price() {
		return pdt_price;
	}
	public void setPdt_price(int pdt_price) {
		this.pdt_price = pdt_price;
	}
	public String getPdt_image() {
		return pdt_image;
	}
	public void setPdt_image(String pdt_image) {
		this.pdt_image = pdt_image;
	}
	public int getPdt_sales() {
		return pdt_sales;
	}
	public void setPdt_sales(int pdt_sales) {
		this.pdt_sales = pdt_sales;
	}
	@Override
	public String toString() {
		return "ProductVo [pdt_num=" + pdt_num + ", pdt_category=" + pdt_category + ", pdt_name=" + pdt_name
				+ ", pdt_date=" + pdt_date + ", pdt_price=" + pdt_price + ", pdt_image=" + pdt_image + ", pdt_sales="
				+ pdt_sales + "]";
	}
	
	
}
