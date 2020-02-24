package com.kh.team2.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.RevReplyVo;
import com.kh.team2.persistence.RevReplyDao;

@Service
public class RevReplyServiceImpl implements RevReplyService {
	
	@Inject
	private RevReplyDao replyDao;

	@Override
	public void insertReply(RevReplyVo replyVo) throws Exception {
		replyDao.insertReply(replyVo);

	}

}
