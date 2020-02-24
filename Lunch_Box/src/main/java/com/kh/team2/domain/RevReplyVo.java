package com.kh.team2.domain;

import java.sql.Timestamp;

public class RevReplyVo {
	private int rep_num;
	private int rep_bno;
	private String rep_writer;
	private String rep_content;
	private Timestamp rep_date;
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public String getRep_writer() {
		return rep_writer;
	}
	public void setRep_writer(String rep_writer) {
		this.rep_writer = rep_writer;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public Timestamp getRep_date() {
		return rep_date;
	}
	public void setRep_date(Timestamp rep_date) {
		this.rep_date = rep_date;
	}
	public int getRep_bno() {
		return rep_bno;
	}
	public void setRep_bno(int rep_bno) {
		this.rep_bno = rep_bno;
	}
	@Override
	public String toString() {
		return "RevReplyVo [rep_num=" + rep_num + ", rep_bno=" + rep_bno + ", rep_writer=" + rep_writer
				+ ", rep_content=" + rep_content + ", rep_date=" + rep_date + "]";
	}
	
	
	
}
