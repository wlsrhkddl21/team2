package com.kh.team2.domain;

import java.sql.Timestamp;

public class BoardVo {
	private int not_num;
	private String not_title;
	private String not_content;
	private String not_writer;
	private Timestamp not_regdate;
	private int not_viewcount;
	
	public int getNot_num() {
		return not_num;
	}
	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getNot_content() {
		return not_content;
	}
	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}
	public String getNot_writer() {
		return not_writer;
	}
	public void setNot_writer(String not_writer) {
		this.not_writer = not_writer;
	}
	public Timestamp getNot_regdate() {
		return not_regdate;
	}
	public void setNot_regdate(Timestamp not_regdate) {
		this.not_regdate = not_regdate;
	}
	public int getNot_viewcount() {
		return not_viewcount;
	}
	public void setNot_viewcount(int not_viewcount) {
		this.not_viewcount = not_viewcount;
	}
	@Override
	public String toString() {
		return "BoardVo [not_num=" + not_num + ", not_title=" + not_title + ", not_content=" + not_content
				+ ", not_writer=" + not_writer + ", not_regdate=" + not_regdate + ", not_viewcount=" + not_viewcount
				+ "]";
	}
	
	
}
