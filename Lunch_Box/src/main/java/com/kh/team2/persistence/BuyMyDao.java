package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.BuyMyVo;

public interface BuyMyDao {
	public int getSeqBuyMyNextVal();
	public void insertBuyMy(BuyMyVo buyMyVo);
	public List<BuyMyVo> selectBuyMyByMemId(String mem_id);
	public List<BuyMyVo> selectBuyMy();
}
