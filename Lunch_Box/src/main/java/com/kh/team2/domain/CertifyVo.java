package com.kh.team2.domain;

public class CertifyVo {
	private String certify_id;
	private String certify_key;

	public CertifyVo(String certify_id, String certify_key) {
		super();
		this.certify_id = certify_id;
		this.certify_key = certify_key;
	}

	public CertifyVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCertify_id() {
		return certify_id;
	}

	public void setCertify_id(String certify_id) {
		this.certify_id = certify_id;
	}

	public String getCertify_key() {
		return certify_key;
	}

	public void setCertify_key(String certify_key) {
		this.certify_key = certify_key;
	}

	@Override
	public String toString() {
		return "certify [certify_id=" + certify_id + ", certify_key=" + certify_key + "]";
	}

}
