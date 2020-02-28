package com.kh.team2.persistence;

import com.kh.team2.domain.CertifyVo;

public interface CertifyDao {
	// key 주기
	public void certifySetKey(CertifyVo certifyVo) throws Exception;
	// key 받는 아이디 체크
	public int certifyCheck(String certify_id) throws Exception;
	// 같은 아이디 받는 key 업데이트
	public void certifyKeyUpdate(CertifyVo certifyVo) throws Exception;
	
}
