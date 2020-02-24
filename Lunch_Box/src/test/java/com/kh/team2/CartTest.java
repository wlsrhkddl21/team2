package com.kh.team2;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team2.domain.CartVo;
import com.kh.team2.persistence.CartDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CartTest {

	@Inject
	CartDao cartDao;
	
	@Test
	public void Testread() throws Exception {
		String mem_id = "jang";
		List<CartVo> list = cartDao.cartList(mem_id);
		System.out.println(list);
	}
	
	@Test
	public void TestAdd() throws Exception {
		CartVo vo = new CartVo();
		vo.setMem_id("jang");
		vo.setPdt_num(23);
		vo.setCart_count(1);
		cartDao.cartInsert(vo);
	}
	
	@Test
	public void Testdelete() throws Exception {
		cartDao.cartDelete(11);
	}
	
	@Test
	public void TestUpdate() throws Exception {
		cartDao.updataCount(3, 125);
	}
	
	@Test
	public void TestisCart() throws Exception {
		int result = cartDao.isCart(85,"jang");
		System.out.println(result);
	}
	
}
