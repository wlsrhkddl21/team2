package com.kh.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team2.domain.FaqVo;
import com.kh.team2.domain.PagingDto;
import com.kh.team2.persistence.FaqDao;

@Service
public class FaqServiceImpl implements FaqService {

	@Inject
	private FaqDao faqDao;
	
	@Override
	public List<FaqVo> listAll(PagingDto pagingDto) throws Exception {
		return faqDao.listAll(pagingDto);
	}

	@Override
	public void create(FaqVo vo) throws Exception {
		faqDao.create(vo);
	}

	@Override
	public void delete(int faq_num) throws Exception {
		faqDao.delete(faq_num);
	}

	@Override
	public void update(FaqVo vo) throws Exception {
		faqDao.update(vo);
	}

	@Override
	public FaqVo read(int faq_num) throws Exception {
		return faqDao.read(faq_num);
	}

	@Override
	public int listCount(PagingDto pagingDto) throws Exception {
		return faqDao.listCount(pagingDto);
	}

}
