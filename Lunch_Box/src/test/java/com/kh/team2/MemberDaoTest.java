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
		memberVo.setMem_name("¹Î");
		memberVo.setMem_id("min");
		memberVo.setMem_pass("1234");
		memberVo.setMem_address("¿ï»ê");
		memberVo.setMem_tel("010123456789");
		dao.insertMember(memberVo);
	}
}
