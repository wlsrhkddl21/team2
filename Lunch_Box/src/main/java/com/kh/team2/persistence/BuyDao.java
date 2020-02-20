package com.kh.team2.persistence;

import com.kh.team2.domain.BuyDetailVo;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.PointVo;

public interface BuyDao {
	public void insertBuy(BuyVo vo) throws Exception;
	public void insertBuyDetail(BuyDetailVo vo) throws Exception;
	public int getSeqBuyNextVal() throws Exception;
}
