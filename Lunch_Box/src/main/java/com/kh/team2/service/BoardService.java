package com.kh.team2.service;

import java.util.List;


import com.kh.team2.domain.BoardVo;

public interface BoardService {

	// 글목록
	public List<BoardVo> listAll() throws Exception;
	
}
