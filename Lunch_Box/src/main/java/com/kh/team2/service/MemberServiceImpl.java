package com.kh.team2.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.persistence.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;

	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		memberDao.insertMember(memberVo);

	}

	@Override
	public MemberVo login(LogingDto logingDto) throws Exception {
		return memberDao.readWithPw(logingDto.getMem_id(), logingDto.getMem_pass());
	}

}
