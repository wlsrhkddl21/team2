package com.kh.team2;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.MemberVo;
import com.kh.team2.persistence.MemberDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDaoTest {
	
	@Inject
	private MemberDao dao;
	
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
}
