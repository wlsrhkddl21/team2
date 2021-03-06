package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.MyLunchVo;
import com.kh.team2.persistence.MyLunchDao;

@Service
public class MyLunchServiceImpl implements MyLunchService {
	@Inject
	MyLunchDao myLunchDao;
	
	@Override
	public void insertMLB(MyLunchVo myLunchVo) throws Exception {
		myLunchDao.insertMLB(myLunchVo);
	}

	@Override
	public void updateMLB(MyLunchVo myLunchVo) throws Exception {
		myLunchDao.updateMLB(myLunchVo);
	}

	@Override
	public MyLunchVo readMLB(int lunch_num) throws Exception {
		return myLunchDao.readMLB(lunch_num);
	}

	@Override
	public List<MyLunchVo> readAllMLB(String lunch_type) throws Exception {
		return myLunchDao.readAllMLB(lunch_type);
	}

	@Override
	public void deleteMLB(int lunch_num) throws Exception {
		myLunchDao.deleteMLB(lunch_num);
	}

}
