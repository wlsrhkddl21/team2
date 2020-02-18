package com.kh.team2.domain;

import java.sql.Timestamp;

public class ntReplyVo {
	private int ntrno;
	private int ntbno;
	private String ntrcontent;
	private String ntrwriter;
	private Timestamp ntrdate;
	private Timestamp ntrudate;
	public ntReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNtrno() {
		return ntrno;
	}
	public void setNtrno(int ntrno) {
		this.ntrno = ntrno;
	}
	public int getNtbno() {
		return ntbno;
	}
	public void setNtbno(int ntbno) {
		this.ntbno = ntbno;
	}
	public String getNtrcontent() {
		return ntrcontent;
	}
	public void setNtrcontent(String ntrcontent) {
		this.ntrcontent = ntrcontent;
	}
	public String getNtrwriter() {
		return ntrwriter;
	}
	public void setNtrwriter(String ntrwriter) {
		this.ntrwriter = ntrwriter;
	}
	public Timestamp getNtrdate() {
		return ntrdate;
	}
	public void setNtrdate(Timestamp ntrdate) {
		this.ntrdate = ntrdate;
	}
	public Timestamp getNtrudate() {
		return ntrudate;
	}
	public void setNtrudate(Timestamp ntrudate) {
		this.ntrudate = ntrudate;
	}
	@Override
	public String toString() {
		return "ntReplyVo [ntrno=" + ntrno + ", ntbno=" + ntbno + ", ntrcontent=" + ntrcontent + ", ntrwriter="
				+ ntrwriter + ", ntrdate=" + ntrdate + ", ntrudate=" + ntrudate + "]";
	}
	
	
}
