package com.kh.team2.persistence;

import com.kh.team2.domain.MemberVo;

public interface MemberDao {
	
	// 회占쏙옙 占쏙옙占쏙옙
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// 占쏙옙占싱듸옙占� 회占쏙옙 占쏙옙회
	public MemberVo readMember(String mem_id) throws Exception;
	
	// 占쏙옙占싱듸옙占� 占쏙옙橘占싫ｏ옙占� 회占쏙옙 占쏙옙회
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception;

	public void setKey(MemberVo memberVo) throws Exception;
	
	// 占쏙옙占싱듸옙 占쌩븝옙체크
	public int idCheck(String mem_id) throws Exception;
	
	public void memUpdate(MemberVo memVo) throws Exception;

}
