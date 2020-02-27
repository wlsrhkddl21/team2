package com.kh.team2.persistence;

import com.kh.team2.domain.MemberVo;

public interface MemberDao {
	
	// ȸ�� ����
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// ���̵�� ȸ�� ��ȸ
	public MemberVo readMember(String mem_id) throws Exception;
	
	// ���̵�� ��й�ȣ�� ȸ�� ��ȸ
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception;

	public MemberVo GetKey(String mem_id, String key);
	
	// ���̵� �ߺ�üũ
	public int idCheck(String mem_id) throws Exception;
	
	public void memUpdate(MemberVo memVo) throws Exception;

//	public void GetKey(String mem_id, String key);
}
