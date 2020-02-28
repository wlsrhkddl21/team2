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
		
	// productVo 에서 상품명 가져오기
	public List<ProductVo> productName() throws Exception;
	
	// 조회수
	public void viewCount(int rev_num) throws Exception;
	
	// 리뷰 삭제
	public void reviewDelete(int rev_num) throws Exception;

	// 상품번호 읽기
	public List<ReviewVo> readPdtNum(int rev_pdt_name) throws Exception;
	
	public int getRev_num () throws Exception;
	
	
}
