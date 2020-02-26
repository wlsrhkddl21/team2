package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team2.domain.BuyDetailVo;
import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.BuyVo;
import com.kh.team2.domain.CartDto;
import com.kh.team2.domain.PointDto;
import com.kh.team2.domain.PointVo;
import com.kh.team2.persistence.BuyDao;
import com.kh.team2.persistence.PointDao;
import com.kh.team2.persistence.ProductDao;

@Service
public class BuyServiceImpl implements BuyService {

	@Inject
	BuyDao buyDao;
	
	@Inject
	PointDao pointDao;
	
	@Inject ProductDao pdtDao;
	
	@Transactional
	@Override
	public void buy(BuyVo vo, PointDto pointDto, CartDto cartDto) throws Exception {
		int nextVal = buyDao.getSeqBuyNextVal();
		System.out.println("nextVal:"+nextVal);
		//tbl_buy
		vo.setBuy_num(nextVal);
		buyDao.insertBuy(vo);

		int[] pdt_num = cartDto.getPdt_num();
		int[] buy_count = cartDto.getBuy_count();
		int usePoint = pointDto.getUse_point()*(-1);
		int savePoint = pointDto.getSave_point();
		int buy_num = nextVal;
		String mem_id = vo.getMem_id();
		
		//tbl_buyDetail -> 상품, 갯수
		for(int i=0;i<pdt_num.length;i++) {
			BuyDetailVo bdVo = new BuyDetailVo();
			bdVo.setPdt_num(pdt_num[i]);
			bdVo.setBuy_count(buy_count[i]);
			bdVo.setBuy_num(buy_num);
			buyDao.insertBuyDetail(bdVo);
			pdtDao.updatePdtSales(pdt_num[i], buy_count[i]);
		}
		
		//포인트 업데이트 (usePoint -값으로 받아오기)
		pointDao.updatePoint(usePoint+savePoint,mem_id);
		
		// 포인트 내역
		if (usePoint != 0) {
			PointVo usePointVo = new PointVo();

			usePointVo.setBuy_num(buy_num);
			usePointVo.setMem_id(mem_id);
			usePointVo.setPoint(usePoint);

			pointDao.insertPoint(usePointVo);
		}

		PointVo savePointVo = new PointVo();

		savePointVo.setBuy_num(buy_num);
		savePointVo.setMem_id(mem_id);
		savePointVo.setPoint(savePoint);

		pointDao.insertPoint(savePointVo);
	}


	@Override
	public List<BuyJoinDto> selectJoinByMemId(String mem_id) throws Exception {
		
		return buyDao.selectJoinByMemId(mem_id);
	}


	@Override
	public List<BuyJoinDto> selectReadAll() throws Exception {
		
		return buyDao.selectReadAll();
	}
	
}
