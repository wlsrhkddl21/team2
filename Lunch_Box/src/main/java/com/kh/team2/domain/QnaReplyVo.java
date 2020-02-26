package com.kh.team2.domain;

import java.sql.Timestamp;

public class QnaReplyVo {
	private int qrnum;
	private int qrbno;
	private String qrcontent;
	private String qrwriter;
	private Timestamp qrdate;
	private Timestamp qrudate;
	
	public QnaReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQrnum() {
		return qrnum;
	}
	public void setQrnum(int qrnum) {
		this.qrnum = qrnum;
	}
	public int getQrbno() {
		return qrbno;
	}
	public void setQrbno(int qrbno) {
		this.qrbno = qrbno;
	}
	public String getQrcontent() {
		return qrcontent;
	}
	public void setQrcontent(String qrcontent) {
		this.qrcontent = qrcontent;
	}
	public String getQrwriter() {
		return qrwriter;
	}
	public void setQrwriter(String qrwriter) {
		this.qrwriter = qrwriter;
	}
	public Timestamp getQrdate() {
		return qrdate;
	}
	public void setQrdate(Timestamp qrdate) {
		this.qrdate = qrdate;
	}
	public Timestamp getQrudate() {
		return qrudate;
	}
	public void setQrudate(Timestamp qrudate) {
		this.qrudate = qrudate;
	}
	@Override
	public String toString() {
		return "QnaReplyVo [qrnum=" + qrnum + ", qrbno=" + qrbno + ", qrcontent=" + qrcontent + ", qrwriter=" + qrwriter
				+ ", qrdate=" + qrdate + ", qrudate=" + qrudate + "]";
	}
	
	
}
