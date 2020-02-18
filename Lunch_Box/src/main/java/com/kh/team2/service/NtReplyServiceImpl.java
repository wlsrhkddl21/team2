package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.ntReplyVo;
import com.kh.team2.persistence.ntReplyDao;

@Service
public class NtReplyServiceImpl implements NtReplyService {

	@Inject
	private ntReplyDao ntreplyDao;
	@Override
	public void create(ntReplyVo ntreplyVo) throws Exception {
		ntreplyDao.create(ntreplyVo);
	}
	
	@Override
	public List<ntReplyVo> list(int ntbno) throws Exception {
		return ntreplyDao.list(ntbno);
	}

	@Override
	public void update(ntReplyVo ntreplyVo) throws Exception {
		ntreplyDao.update(ntreplyVo);
	}

	@Override
	public void delete(int ntrno) throws Exception {
		ntreplyDao.delete(ntrno);
	}

}
