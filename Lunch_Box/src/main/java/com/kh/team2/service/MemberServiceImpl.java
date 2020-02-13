package com.kh.team2.service;

import javax.inject.Inject;

import com.kh.team2.domain.MemberVo;
import com.kh.team2.persistence.MemberDao;

public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;

	@Override
	public void join(MemberVo memberVo) throws Exception {
		memberDao.insertMember(memberVo);

	}

}
