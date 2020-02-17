package com.kh.team2.service;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;

public interface MemberService {
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// 로그인
	public MemberVo login(LogingDto logingDto) throws Exception;
	
	// 아이디 체크
	public MemberVo readMember(String mem_id) throws Exception;
	
	// 아이디 비밀번호 체크
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception;
}
