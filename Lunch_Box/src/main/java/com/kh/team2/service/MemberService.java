package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.PointVo;

public interface MemberService {
	// �쉶�썝異붽�
	public void insertMember(MemberVo memberVo) throws Exception;
	
	// 占싸깍옙占쏙옙
	public MemberVo login(LogingDto logingDto) throws Exception;
	
	// 占쏙옙占싱듸옙 체크
	public MemberVo readMember(String mem_id) throws Exception;
	
	// 占쏙옙占싱듸옙 占쏙옙橘占싫� 체크
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception;
	
	// 占쏙옙占싱듸옙 占쌩븝옙체크
	public int idCheck(String mem_id) throws Exception;
	
	public List<PointVo> pointList (String mem_id) throws Exception;
	
	public void memUpdate(MemberVo memVo) throws Exception;
	
	public void setKey(MemberVo memberVo) throws Exception;
}
