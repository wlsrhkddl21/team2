package com.kh.team2.domain;

public class PointDto {
	
	private int use_point;
	private int save_point;
	
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getSave_point() {
		return save_point;
	}
	public void setSave_point(int save_point) {
		this.save_point = save_point;
	}
	@Override
	public String toString() {
		return "PointDto [use_point=" + use_point + ", save_point=" + save_point + "]";
	}
	
}
