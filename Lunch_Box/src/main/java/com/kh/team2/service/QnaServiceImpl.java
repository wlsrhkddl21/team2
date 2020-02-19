package com.kh.team2.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.persistence.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {

	private QnaDao qnaDao;
	
	@Override
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception {
		return qnaDao.listAll(pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		return qnaDao.listCount(pagingDto);
	}

}
