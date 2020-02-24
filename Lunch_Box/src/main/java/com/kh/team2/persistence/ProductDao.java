package com.kh.team2.persistence;

public interface ProductDao {
	public int selectSingleCount();
	public int selectSubCount();
	public void updatePdtSales(int pdt_num,int pdt_sales);
}
