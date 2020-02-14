package com.kh.team2.persistence;

import com.kh.team2.domain.MemberVo;

public interface MemberDao {
	
	// ȸ�� ����
	public void insertMember(MemberVo memberVo);
	
	// ���̵�� ȸ�� ��ȸ
	public MemberVo readMember(String mem_id);
	
	// ���̵�� ��й�ȣ�� ȸ�� ��ȸ
	public MemberVo readWithPw(String mem_id, String mem_pass);

	public MemberVo GetKey(String mem_id, String key);

//	public void GetKey(String mem_id, String key);
}
