package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;

public interface BoardService {

	// 글목록
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception;
	// 글갯수
	public int listCount(PagingDto pagingDto) throws Exception;
	// 글쓰기
	public void create(BoardVo vo) throws Exception;
	// 글 읽기
	public BoardVo read(int not_num) throws Exception;
	// 글삭제
	public void delete(int not_num) throws Exception;
	// 글수정
	public void update(BoardVo vo) throws Exception;
}
