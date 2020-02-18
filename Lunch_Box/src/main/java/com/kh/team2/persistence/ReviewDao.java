package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ReviewVo;

public interface ReviewDao {
	// 리스트 한개 조회
	public ReviewVo selectList(int rev_num) throws Exception;
	
	// 리스트 조회
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception;
	
	// 페이지
	public int listCount(PagingDto pagingDto) throws Exception;
}
