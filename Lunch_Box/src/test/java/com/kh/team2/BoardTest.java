package com.kh.team2;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.BoardVo;
import com.kh.team2.domain.QnaVo;
import com.kh.team2.domain.ntReplyVo;
import com.kh.team2.persistence.BoardDao;
import com.kh.team2.persistence.QnaDao;
import com.kh.team2.persistence.ntReplyDao;
import com.kh.team2.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardTest {
	
	@Inject
	private BoardDao dao;
	@Inject
	private ntReplyDao ntDao;
	@Inject
	private QnaDao qnaDao;
	
	@Inject
	private BoardService service;
	@Test
	public void testCreate() throws Exception{
		BoardVo vo = new BoardVo();
		vo.setNot_num(724);
		vo.setNot_title("테스트");
		vo.setNot_content("테스트트");
		vo.setNot_writer("테스터");
		
		dao.create(vo);
	}
	
	@Test
	public void testNextSeq() throws Exception {
		dao.getNextVal();
	}
	@Test
	public void testRead() throws Exception {
		int not_num = 680;
		service.read(not_num);
	}
	
	@Test
	public void testUpdate() throws Exception {
		BoardVo vo = new BoardVo();
		vo.setNot_num(734);
		vo.setNot_title("수정테스트");
		vo.setNot_content("수정테스트");
		
		dao.update(vo);
	}
	
	@Test
	public void testDelete() throws Exception {
		int not_num = 736;
		dao.delete(not_num);
	}
	
	@Test
	public void testHot() throws Exception {
		BoardVo vo = new BoardVo();
		vo.setNot_num(737);
		vo.setNot_title("수정테스트");
		vo.setNot_content("수정테스트");
		vo.setNot_hot(1);
		dao.update(vo);
	}
	
	@Test
	public void ntDao() throws Exception {
		ntReplyVo ntreplyVo = new ntReplyVo();
		ntreplyVo.setNtrno(2);
		ntreplyVo.setNtbno(744);
		ntreplyVo.setNtrcontent("댓글테스트1");
		ntreplyVo.setNtrwriter("admin");
	}
}
