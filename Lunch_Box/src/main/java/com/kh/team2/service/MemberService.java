package com.kh.team2.service;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;

public interface MemberService {
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// ·Î±×ÀÎ
	public MemberVo login(LogingDto logingDto) throws Exception;
}
