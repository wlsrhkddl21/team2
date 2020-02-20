package com.kh.team2.persistence;

import com.kh.team2.domain.PointVo;

public interface PointDao {
	public void updatePoint(int point,String mem_id) throws Exception;
	public void insertPoint(PointVo vo) throws Exception;
}
