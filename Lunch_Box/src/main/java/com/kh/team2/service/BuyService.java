package com.kh.team2.service;

import java.util.List;


import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.BuyMyVo;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.CartDto;
import com.kh.team2.domain.PointDto;

public interface BuyService {
	//구매 (구매 테이블, 디테일, 포인트)
	public void buy(BuyVo vo,PointDto pointDto,CartDto cartDto) throws Exception;
	public void buyMy(BuyMyVo buyVo,PointDto pointDto) throws Exception ;
	public List<BuyJoinDto> selectJoinByMemId(String mem_id) throws Exception;
	public List<BuyJoinDto> selectReadAll()	throws Exception; 
} 
