package com.kh.team2;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.MemberVo;
import com.kh.team2.persistence.CertifyDao;
import com.kh.team2.persistence.MemberDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDaoTest {
	
	@Inject
	private MemberDao dao;
	
	@Inject
	private CertifyDao dao2;
	
	@Test
	public void testInsertMember() throws Exception {
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_name("장석천");
		memberVo.setMem_id("jang");
		memberVo.setMem_pass("1234");
		memberVo.setMem_address("울산");
		memberVo.setMem_tel("010123456789");
		dao.insertMember(memberVo);
	}
	
	@Test
	public void testReadMember() throws Exception {
		String mem_id = "jang@email.com";
		dao.readMember(mem_id);
	}
	
	@Test
	public void testReadPw() throws Exception {
		String mem_id = "jang@email.com";
		String mem_pass = "1234";
		dao.readWithPw(mem_id, mem_pass);
	}
	
	@Test
	public void testCheck() throws Exception {
		String result = dao2.ynCheck("klnhara@naver.com");
		System.out.println(result);
	}
}
