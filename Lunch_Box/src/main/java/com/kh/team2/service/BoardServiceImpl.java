package com.kh.team2.service;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDao boardDao;

	@Override
	public List<BoardVo> listAll() throws Exception {
		return boardDao.listAll();
	}


}
