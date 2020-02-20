package com.kh.team2.domain;

import java.sql.Timestamp;

public class QnaVo {
	private int qna_num;
	private String qna_title;
	private String qna_content;
	private String qna_writer;
	private Timestamp qna_regdate;
	private int qna_viewcount;
	private int qna_ref;
	private int qna_restep;
	private int qna_relevel;
	public QnaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public Timestamp getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Timestamp qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	public int getQna_viewcount() {
		return qna_viewcount;
	}
	public void setQna_viewcount(int qna_viewcount) {
		this.qna_viewcount = qna_viewcount;
	}
	public int getQna_ref() {
		return qna_ref;
	}
	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}
	public int getQna_restep() {
		return qna_restep;
	}
	public void setQna_restep(int qna_restep) {
		this.qna_restep = qna_restep;
	}
	public int getQna_relevel() {
		return qna_relevel;
	}
	public void setQna_relevel(int qna_relevel) {
		this.qna_relevel = qna_relevel;
	}
	@Override
	public String toString() {
		return "QnaVo [qna_num=" + qna_num + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_writer=" + qna_writer + ", qna_regdate=" + qna_regdate + ", qna_viewcount=" + qna_viewcount
				+ ", qna_ref=" + qna_ref + ", qna_restep=" + qna_restep + ", qna_relevel=" + qna_relevel + "]";
	}
	
	
}
