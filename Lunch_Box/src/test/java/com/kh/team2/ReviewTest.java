package com.kh.team2;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.RevReplyVo;
import com.kh.team2.domain.ReviewVo;
import com.kh.team2.persistence.RevReplyDao;
import com.kh.team2.persistence.ReviewDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReviewTest {
	
	@Inject
	private ReviewDao dao;
	
	@Inject
	private RevReplyDao repDao;
	
	
	
	@Test
	public void testRead() throws Exception {
		int rev_num = 54;
		dao.readReview(rev_num);
	}
	
	@Test
	public void testInsert() throws Exception {
		ReviewVo vo = new ReviewVo();
		vo.setRev_title("테스트 제목3");
		vo.setRev_writer("작성자 테스트3");
		vo.setRev_content("내용 테스트3");
		dao.insertReview(vo);
	}
	
	@Test
	public void inserReply() throws Exception {
		RevReplyVo repVo = new RevReplyVo();
		repVo.setRep_bno(2);
		repVo.setRep_writer("댓글테스트2");
		repVo.setRep_content("댓글내용테스트2");
		repDao.insertReply(repVo);
	}
	
	@Test
	public void replyList() throws Exception {
		int rep_bno = 61;
		repDao.list(rep_bno);
	}
	
	@Test
	public void readPdt() throws Exception {
		int rev_pdt_name = 92;
		dao.readPdtNum(rev_pdt_name);
	}
}
