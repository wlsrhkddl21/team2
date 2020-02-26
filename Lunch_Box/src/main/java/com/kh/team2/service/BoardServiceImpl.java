package com.kh.team2.service;

import java.util.List;





import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.persistence.BoardDao;
import com.kh.team2.persistence.ntReplyDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao boardDao;
	@Inject
	private ntReplyDao ntreplyDao;

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
		boardDao.updateViewCount(not_num);
		return boardDao.read(not_num);
	}

	@Override
	@Transactional
	public void delete(int not_num) throws Exception {
		ntreplyDao.deleteNum(not_num);
		boardDao.delete(not_num);
	}

	@Override
	public void update(BoardVo vo) throws Exception {
		boardDao.update(vo);
	}

	@Override
	public List<BoardVo> hotList(PagingDto pagingDto) throws Exception {
		return boardDao.hotList(pagingDto);
	}

	@Override
	public void hotUpdate(BoardVo vo) throws Exception {
		boardDao.hotUpdate(vo);
		
	}

	@Override
	public void hotDelete(BoardVo vo) throws Exception {
		boardDao.hotDelete(vo);
		
	}

	@Override
	public List<BoardVo> listPage(PagingDto pagingDto) throws Exception {
		return boardDao.listPage(pagingDto);
	}




}
