package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;

public interface ReviewDao {
	// ����Ʈ �Ѱ� ��ȸ
	public ReviewVo readReview(int rev_num) throws Exception;
	
	// ����Ʈ ��ȸ
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception;

	// 고객센터 리뷰목록
	public List<ReviewVo> reviewList(PagingDto pagingDto) throws Exception;
	
	// ������
	public int listCount(PagingDto pagingDto) throws Exception;
	
	// ���� �۾���
	public void insertReview(ReviewVo reviewVo) throws Exception;
		
	//
	public List<ProductVo> productName() throws Exception;
}
