package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ReviewVo;

public interface ReviewService {

	// ��� �� ����Ʈ
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception;
	
	// ������
	public int listCount(PagingDto pagingDto) throws Exception;
}
