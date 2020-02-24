package com.kh.team2.persistence;

import java.util.List;

import com.kh.team2.domain.FaqVo;
import com.kh.team2.domain.PagingDto;

public interface FaqDao {

	public int getNextVal() throws Exception;
	
	public List<FaqVo> listAll(PagingDto pagingDto) throws Exception;
	
	public int listCount(PagingDto pagingDto) throws Exception;
	
	public void create(FaqVo vo) throws Exception;
	
	public FaqVo read(int faq_num) throws Exception;
	
	public void delete(int faq_num) throws Exception;
	
	public void update(FaqVo faqVo) throws Exception;
}
