package com.kh.team2.service;

import java.util.List;

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

	@Override
	public List<RevReplyVo> list(int rep_bno) throws Exception {
		return replyDao.list(rep_bno);
	}

	@Override
	public void update(RevReplyVo replyVo) throws Exception {
		replyDao.update(replyVo);
		
	}

	@Override
	public void delete(int rep_num) throws Exception {
		replyDao.delete(rep_num);
		
	}

}
