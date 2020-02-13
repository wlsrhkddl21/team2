package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;

public interface BoardDao {

	// 데이터 목록
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception;
	
	// 데이터 개수
	public int listCount(PagingDto pagingDto) throws Exception;

}
