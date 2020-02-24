package com.kh.team2.domain;

import java.sql.Timestamp;

public class FaqVo {
	private int faq_num;
	private String faq_title;
	private String faq_content;
	private String faq_writer;
	private Timestamp faq_regdate;
	
	public FaqVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_writer() {
		return faq_writer;
	}
	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}
	public Timestamp getFaq_regdate() {
		return faq_regdate;
	}
	public void setFaq_regdate(Timestamp faq_regdate) {
		this.faq_regdate = faq_regdate;
	}
	@Override
	public String toString() {
		return "FaqVO [faq_num=" + faq_num + ", faq_title=" + faq_title + ", faq_content=" + faq_content
				+ ", faq_writer=" + faq_writer + ", faq_regdate=" + faq_regdate + "]";
	}
	
	
}
