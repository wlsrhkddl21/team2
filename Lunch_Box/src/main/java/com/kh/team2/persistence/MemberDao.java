package com.kh.team2.persistence;

import com.kh.team2.domain.MemberVo;

public interface MemberDao {
	
	// 회원 가입
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// 아이디로 회원 조회
	public MemberVo readMember(String mem_id) throws Exception;
	
	// 아이디랑 비밀번호로 회원 조회
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception;

	public MemberVo GetKey(String mem_id, String key);
	
	// 아이디 중복체크
	public int idCheck(String mem_id) throws Exception;

//	public void GetKey(String mem_id, String key);
}
