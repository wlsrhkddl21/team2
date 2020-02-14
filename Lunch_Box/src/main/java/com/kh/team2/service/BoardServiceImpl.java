package com.kh.team2.service;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao boardDao;

	@Override
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception {
		return boardDao.listAll(pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		return boardDao.listCount(pagingDto);
	}

	@Override
	public void create(BoardVo vo) throws Exception {
		boardDao.create(vo);
	}

	@Override
	public BoardVo read(int not_num) throws Exception {
		return boardDao.read(not_num);
	}

	@Override
	public void delete(int not_num) throws Exception {
		boardDao.delete(not_num);
		
	}

	@Override
	public void update(BoardVo vo) throws Exception {
		boardDao.update(vo);
	}



}
