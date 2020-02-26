package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.QnaReplyVo;
import com.kh.team2.persistence.QnaReplyDao;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	@Inject
	private QnaReplyDao qnaReplyDao;
	
	@Override
	public void create(QnaReplyVo qnaReplyVo) throws Exception {
		qnaReplyDao.create(qnaReplyVo);
	}

	@Override
	public List<QnaReplyVo> list(int qrbno) throws Exception {
		return qnaReplyDao.list(qrbno);
	}

	@Override
	public void update(QnaReplyVo qnaReplyVo) throws Exception {
		qnaReplyDao.update(qnaReplyVo);
	}

	@Override
	public void delete(int qrnum) throws Exception {
		qnaReplyDao.delete(qrnum);
	}

}
