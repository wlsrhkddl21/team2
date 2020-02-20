package com.kh.team2;

import javax.inject.Inject;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.MyLunchVo;
import com.kh.team2.persistence.AdminDao;
import com.kh.team2.persistence.MyLunchDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AdminTest {
	
	@Inject
	private AdminDao dao;
	
	@Inject
	private MyLunchDao mydao;
	
	@Test
	public void testReadAll() throws Exception{
		dao.readAllPDT();
	}
	
	
	@Test
	public void testinsertmlb() throws Exception{
		MyLunchVo vo = new MyLunchVo();
		vo.setLunch_name("김치");
		vo.setLunch_price(700);
		vo.setLunch_type("반찬");
		mydao.insertMLB(vo);
	}
	
	@Test
	public void testreadAll() throws Exception{
		mydao.readAllMLB("side");
	}
	
}
