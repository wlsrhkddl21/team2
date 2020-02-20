package com.kh.team2.controlloer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team2.domain.MyLunchVo;
import com.kh.team2.persistence.MyLunchService;

@RequestMapping(value="/myLunch/")
@Controller
public class MyLunchController {
	
	@Inject
	MyLunchService service;
	
	@RequestMapping(value="readAll",method = RequestMethod.GET)
	public String readAllMLB(Model model) throws Exception{
		List<MyLunchVo> list = service.readAllMLB();
		model.addAttribute("list",list);
		return "admin/myLunchBoxList";
	}
	
	@ResponseBody
	@RequestMapping(value="insert",method = RequestMethod.POST)
	public String insertMLB(MyLunchVo myLunchVo) throws Exception{
		service.insertMLB(myLunchVo);
		System.out.println(myLunchVo);
		return "success";
	}

}
