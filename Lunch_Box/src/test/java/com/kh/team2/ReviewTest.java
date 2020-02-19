package com.kh.team2;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.ReviewVo;
import com.kh.team2.persistence.ReviewDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewTest {
	
	@Inject
	private ReviewDao dao;
	
	
	
	@Test
	public void testRead() throws Exception {
		int rev_num = 502;
		dao.selectList(rev_num);
	}
	
	@Test
	public void testInsert() throws Exception {
		ReviewVo vo = new ReviewVo();
		vo.setRev_title("502제목");
		vo.setRev_writer("502작성자");
		vo.setRev_content("502내용");
		dao.insertReview(vo);
	}
	
	
	
}
