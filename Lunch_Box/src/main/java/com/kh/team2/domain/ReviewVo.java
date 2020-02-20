package com.kh.team2.domain;

import java.sql.Timestamp;

public class ReviewVo {
	private int rev_num;
	private String rev_title;
	private String rev_writer;
	private Timestamp rev_regdate;
	private String rev_content;
	private int rev_pdt_name;
	private String rev_image;
	
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public String getRev_title() {
		return rev_title;
	}
	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}
	public String getRev_writer() {
		return rev_writer;
	}
	public void setRev_writer(String rev_writer) {
		this.rev_writer = rev_writer;
	}
	public Timestamp getRev_regdate() {
		return rev_regdate;
	}
	public void setRev_regdate(Timestamp rev_regdate) {
		this.rev_regdate = rev_regdate;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public int getRev_pdt_name() {
		return rev_pdt_name;
	}
	public void setRev_pdt_name(int rev_pdt_name) {
		this.rev_pdt_name = rev_pdt_name;
	}
	public String getRev_image() {
		return rev_image;
	}
	public void setRev_image(String rev_image) {
		this.rev_image = rev_image;
	}
	
	@Override
	public String toString() {
		return "ReviewVo [rev_num=" + rev_num + ", rev_title=" + rev_title + ", rev_writer=" + rev_writer
				+ ", rev_regdate=" + rev_regdate + ", rev_content=" + rev_content + ", rev_pdt_name=" + rev_pdt_name
				+ ", rev_image=" + rev_image + "]";
	}
	
	
	
}
