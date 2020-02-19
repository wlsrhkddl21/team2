package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.QnaVo;
import com.kh.team2.persistence.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDao qnaDao;
	
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

}
