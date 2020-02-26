package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.QnaVo;
import com.kh.team2.persistence.QnaDao;
import com.kh.team2.persistence.QnaReplyDao;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDao qnaDao;
	@Inject
	private QnaReplyDao qnaReplyDao;
	
	@Override
	public List<QnaVo> listAll(PagingDto pagingDto) throws Exception {
		return qnaDao.listAll(pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		return qnaDao.listCount(pagingDto);
	}

	@Override
	public QnaVo read(int qna_num) throws Exception {
		return qnaDao.read(qna_num);
	}

	@Override
	public void create(QnaVo vo) throws Exception {
		qnaDao.create(vo);
	}

	@Override
	@Transactional
	public void answer(QnaVo vo) throws Exception {
		qnaDao.answer(vo);
		qnaDao.updateSuccess(vo);
	}

	@Override
	public void update(QnaVo vo) throws Exception {
		qnaDao.update(vo);
	}

	@Override
	public void delete(int qna_ref) throws Exception {
		qnaReplyDao.deleteNum(qna_ref);
		qnaDao.delete(qna_ref);
	}


}
