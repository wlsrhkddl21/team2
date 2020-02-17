package com.kh.team2.persistence;

import com.kh.team2.domain.ReviewVo;

public interface ReviewDao {
	public void listAll(ReviewVo vo) throws Exception;
}
