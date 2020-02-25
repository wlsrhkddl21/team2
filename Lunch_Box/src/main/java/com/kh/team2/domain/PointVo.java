package com.kh.team2.domain;

public class PointVo {
	private int point_num;
	private String mem_id;
	private int buy_num;
	private int point;
	private String point_date;

	public String getPoint_date() {
		return point_date;
	}

	public void setPoint_date(String point_date) {
		this.point_date = point_date;
	}

	public int getPoint_num() {
		return point_num;
	}

	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "PointVo [point_num=" + point_num + ", mem_id=" + mem_id + ", buy_num=" + buy_num + ", point=" + point
				+ ", point_date=" + point_date + "]";
	}

}
