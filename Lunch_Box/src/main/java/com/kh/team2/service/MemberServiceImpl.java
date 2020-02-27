package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.LogingDto;
import com.kh.team2.domain.MemberVo;
import com.kh.team2.domain.PointVo;
import com.kh.team2.persistence.MemberDao;
import com.kh.team2.persistence.PointDao;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao memberDao;
	
	@Inject
	private PointDao pointDao;

	@Override
	public void insertMember(MemberVo memberVo) throws Exception {
		memberDao.insertMember(memberVo);

	}

	@Override
	public MemberVo login(LogingDto logingDto) throws Exception {
		return memberDao.readWithPw(logingDto.getMem_id(), logingDto.getMem_pass());
	}

	@Override
	public MemberVo readMember(String mem_id) throws Exception {
		return memberDao.readMember(mem_id);
	}

	@Override
	public MemberVo readWithPw(String mem_id, String mem_pass) throws Exception {
		return memberDao.readWithPw(mem_id, mem_pass);
	}

	@Override
	public int idCheck(String mem_id) throws Exception {
		return memberDao.idCheck(mem_id);
	}

	@Override
	public List<PointVo> pointList(String mem_id) throws Exception {
	
		return pointDao.pointList(mem_id);
	}

	@Override
	public void memUpdate(MemberVo memVo) throws Exception {
		memberDao.memUpdate(memVo);
		
	}

	@Override
	public void setKey(MemberVo memberVo) throws Exception {
		memberDao.setKey(memberVo);
	}

}
