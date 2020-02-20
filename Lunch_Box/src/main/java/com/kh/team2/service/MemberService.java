package com.kh.team2.service;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;

public interface MemberService {
	// 회원추가
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// �α���
	public MemberVo login(LogingDto logingDto) throws Exception;
	
	// ���̵� üũ
	public MemberVo readMember(String mem_id) throws Exception;
	
	// ���̵� ��й�ȣ üũ
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception;
	
	// ���̵� �ߺ�üũ
	public int idCheck(String mem_id) throws Exception;
	
}
