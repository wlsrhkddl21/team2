package com.kh.team2.persistence;

import java.util.List;


import com.kh.team2.domain.BoardVo;

public interface BoardDao {

	// 데이터 목록
	public List<BoardVo> listAll() throws Exception;
}
