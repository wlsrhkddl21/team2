package com.kh.team2.controlloer;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.util.AdminFileUploadUtil;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Inject
	AdminService service;
	@Resource
	private String uploadPath;
	
	@RequestMapping(value ="list",method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		List<ProductVo> list = service.readAllPDT();
		model.addAttribute("list", list);
		return "admin/list";
	}
	
	@RequestMapping(value ="content",method = RequestMethod.GET)
	public String content(Model model,int pdt_num) throws Exception{
		ProductVo productVo = service.readPDT(pdt_num);
		model.addAttribute("productVo", productVo);
		return "admin/content";
	}
	
	@RequestMapping(value ="insertPDT",method = RequestMethod.GET)
	public String InsertGetPDT() throws Exception {
		return "admin/insertPDT";
	}
	
	@RequestMapping(value ="insertPDT",method = RequestMethod.POST)
	public String InsertPDT(ProductVo productVo, MultipartHttpServletRequest req) throws Exception {
		MultipartFile mFile =  req.getFile("file");
		String originalFilename = mFile.getOriginalFilename();
		productVo.setPdt_image(originalFilename);
		String dirPath = AdminFileUploadUtil.uploadFile(uploadPath+"/product", originalFilename, mFile.getBytes());
		String path = dirPath.replace("\\", "/");
		System.out.println("path:" + path);
		productVo.setPdt_image("\\"+path);
		service.insertPDT(productVo);
		System.out.println("productVo:"+productVo);
		return "redirect:/admin/list";
	}
}
