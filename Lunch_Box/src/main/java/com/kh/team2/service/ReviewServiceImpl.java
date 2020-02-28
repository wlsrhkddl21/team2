package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.PagingDto;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.persistence.ReviewDao;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDao dao;

	@Override
	public List<ReviewVo> listAll(PagingDto pagingDto) throws Exception {
		return dao.listAll(pagingDto);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		return dao.listCount(pagingDto);
	}

	@Override
	public void insertReview(ReviewVo reviewVo) throws Exception {
		dao.insertReview(reviewVo); 
		
		
	}

	@Override
	public List<ProductVo> productName() throws Exception {
		return dao.productName();
	}

	@Override
	public ReviewVo readReview(int rev_num) throws Exception {
		dao.viewCount(rev_num);
		return dao.readReview(rev_num);
	}

	@Override
	public List<ReviewVo> reviewList(PagingDto pagingDto) throws Exception {
		return dao.reviewList(pagingDto);
	}

	@Override
	public void reviewDelete(int rev_num) throws Exception {
		dao.reviewDelete(rev_num);
		
	}

	@Override
	public List<ReviewVo> readPdtNum(int rev_pdt_name) throws Exception {
		return dao.readPdtNum(rev_pdt_name);
	}

}
