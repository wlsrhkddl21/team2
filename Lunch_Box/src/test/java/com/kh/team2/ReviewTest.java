package com.kh.team2;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.persistence.ReviewDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewTest {
	
	@Inject
	private ReviewDao dao;
	
	
	
	@Test
	public void testRead() throws Exception {
		int rev_num = 2;
		dao.selectList(rev_num);
	}
	
	
	
}
