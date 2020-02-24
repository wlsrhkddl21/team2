package com.kh.team2.controlloer;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.team2.domain.MyLunchVo;
import com.kh.team2.service.MyLunchService;

@RequestMapping(value="/myLunch/")
@Controller
public class MyLunchController {
	
	@Inject
	MyLunchService service;
	
	@RequestMapping(value="readAll",method = RequestMethod.GET)
	public String readAllMLB(Model model,String lunch_type) throws Exception{
//		System.out.println(lunch_type);
		List<MyLunchVo> list = service.readAllMLB(lunch_type);
		model.addAttribute("list",list);
		model.addAttribute("lunch_type",lunch_type);
		return "admin/myLunchBoxList";
	}
	
	@ResponseBody
	@RequestMapping(value="insert",method = RequestMethod.POST)
	public String insertMLB(MyLunchVo myLunchVo) throws Exception{
		service.insertMLB(myLunchVo);
//		System.out.println(myLunchVo);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="update",method = RequestMethod.POST)
	public String updateMLB(@RequestBody MyLunchVo myLunchVo) throws Exception{
		service.updateMLB(myLunchVo);
//		System.out.println(myLunchVo);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String deleteMLB(int lunch_num) throws Exception{
		service.deleteMLB(lunch_num);
//		System.out.println(lunch_num);
		return "success";
	}
}
