package com.kh.team2.persistence;

import com.kh.team2.domain.CertifyVo;

public interface CertifyDao {
	// key �ֱ�
	public void certifySetKey(CertifyVo certifyVo) throws Exception;
	// key �޴� ���̵� üũ
	public int certifyCheck(String certify_id) throws Exception;
	// ���� ���̵� �޴� key ������Ʈ
	public void certifyKeyUpdate(CertifyVo certifyVo) throws Exception;
	
}
