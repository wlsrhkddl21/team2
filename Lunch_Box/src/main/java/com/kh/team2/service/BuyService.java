package com.kh.team2.service;

import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.CartDto;
import com.kh.team2.domain.PointDto;
import com.kh.team2.domain.PointVo;

public interface BuyService {
	//구매 (구매 테이블, 디테일, 포인트)
	public void buy(BuyVo vo,PointDto pointDto,CartDto cartDto) throws Exception;
	public void insertPoint(PointVo pointVo) throws Exception;
}
