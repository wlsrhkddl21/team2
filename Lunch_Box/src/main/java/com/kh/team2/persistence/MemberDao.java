package com.kh.team2.persistence;

import com.kh.team2.domain.MemberVo;

public interface MemberDao {
	
	// 회원 가입
	public void insertMember(MemberVo memberVo);
}
