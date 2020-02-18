package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ReviewVo;

public interface ReviewService {

	// 등록 글 리스트
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception;
	
	// 페이지
	public int listCount(PagingDto pagingDto) throws Exception;
}
