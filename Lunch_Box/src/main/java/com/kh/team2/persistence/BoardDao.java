package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.PagingDto;

public interface BoardDao {
	
	// 다음 시퀀스 값 얻기
	public int getNextVal() throws Exception;
	// 데이터 목록
	public List<BoardVo> listAll(PagingDto pagingDto) throws Exception;
	// 데이터 개수
	public int listCount(PagingDto pagingDto) throws Exception;
	// 데이터 추가
	public void create(BoardVo vo) throws Exception;
	// 데이터 읽기
	public BoardVo read(int not_num) throws Exception;
	// 데이터 삭제
	public void delete(int not_num)  throws Exception; 
	// 데이터 수정
	public void update(BoardVo vo) throws Exception;
}
