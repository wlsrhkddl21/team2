package com.kh.team2.service;

import java.util.List;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;

public interface ReviewService {

	// ��� �� ����Ʈ
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception;

	// 고객센터 리뷰목록
	public List<ReviewVo> reviewList(PagingDto pagingDto) throws Exception;
	
	// ������
	public int listCount(PagingDto pagingDto) throws Exception;
	
	// 글 등록
	public void insertReview(ReviewVo reviewVo) throws Exception;
	
	// 
	public List<ProductVo> productName() throws Exception;
	
	// 리뷰상세보기
	public ReviewVo readReview(int rev_num) throws Exception;
	
	// 리뷰삭제
	public void reviewDelete(int rev_num) throws Exception;
}
