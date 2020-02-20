package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.MyLunchVo;


public interface MyLunchDao {
	public void insertMLB (MyLunchVo myLunchVo) throws Exception;
	public void updateMLB (MyLunchVo myLunchVo) throws Exception;
	public MyLunchVo readMLB (int lunch_num) throws Exception;
	public List<MyLunchVo> readAllMLB (String lunch_type) throws Exception;
	public void deleteMLB (int lunch_num) throws Exception;
}
