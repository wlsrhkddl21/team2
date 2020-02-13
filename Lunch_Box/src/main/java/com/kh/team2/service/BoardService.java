package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;

public interface BoardService {

	// 글목록
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception;
	// 글갯수
	public int listCount(PagingDto pagingDto) throws Exception;
}
