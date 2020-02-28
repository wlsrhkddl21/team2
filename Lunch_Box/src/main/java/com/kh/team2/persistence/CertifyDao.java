package com.kh.team2.persistence;

import com.kh.team2.domain.CertifyVo;

public interface CertifyDao {
	// key 주기
	public void certifySetKey(CertifyVo certifyVo) throws Exception;
	// key 받는 아이디 체크
	public int certifyCheck(String certify_id) throws Exception;
	// 같은 아이디 받는 key 업데이트
	public void certifyKeyUpdate(CertifyVo certifyVo) throws Exception;
	// 인증 하기
	public int certify(CertifyVo certifyVo) throws Exception;
	// 인증 완료
	public void certifySuccess(String certify_id) throws Exception;
	// 인증 여부 체크
	public String ynCheck(String certify_id) throws Exception;
	// 가입 완료 삭제
	public void deleteCertify(String certify_id) throws Exception;
}
