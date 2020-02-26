package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.BuyDetailVo;
import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.BuyVo;

public interface BuyDao {
	public void insertBuy(BuyVo vo) throws Exception;
	public void insertBuyDetail(BuyDetailVo vo) throws Exception;
	public int getSeqBuyNextVal() throws Exception;
	public List<BuyJoinDto> selectJoinByMemId(String mem_id) throws Exception;
	public List<BuyJoinDto> selectReadAll() throws Exception;
}
