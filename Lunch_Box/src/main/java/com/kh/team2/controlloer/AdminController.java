package com.kh.team2.controlloer;


import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.team2.domain.BuyJoinDto;
import com.kh.team2.domain.BuyMyVo;
import com.kh.team2.domain.ProductVo;
import com.kh.team2.service.AdminService;
import com.kh.team2.service.BuyService;
import com.kh.team2.util.AdminFileUploadUtil;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Inject
	AdminService service;
	
	@Inject
	BuyService buyService;
	
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
	public String insertGetPDT() throws Exception {
		return "admin/insertPDT";
	}
	
	@RequestMapping(value ="insertPDT",method = RequestMethod.POST)
	public String insertPDT(ProductVo productVo, MultipartHttpServletRequest req) throws Exception {
		MultipartFile mFile =  req.getFile("file");
		MultipartFile sFile =  req.getFile("subFile");
		String originalFilename = mFile.getOriginalFilename();
		String originalSubFilename = sFile.getOriginalFilename();
		System.out.println("file:"+originalFilename);
		System.out.println("subFile:"+originalSubFilename);
//		if(originalFilename!="") {
			String dirPath = AdminFileUploadUtil.uploadFile(uploadPath+"/product", originalFilename, mFile.getBytes(),true);
			String mainPath = dirPath.replace("\\", "/");
			productVo.setPdt_image(mainPath);
//		}
//		if(originalSubFilename!="") {
			String dirSubPath = AdminFileUploadUtil.uploadFile(uploadPath+"/product", originalSubFilename, sFile.getBytes(),false);
			String subPath = dirSubPath.replace("\\", "/");
			productVo.setPdt_subimage(subPath);
//		}
		service.insertPDT(productVo);
		return "redirect:/admin/list";
	}
	
	@RequestMapping(value="updatePDT",method=RequestMethod.POST)
	public String UpdatePDT(ProductVo productVo,MultipartHttpServletRequest req) throws Exception{
		MultipartFile mFile = req.getFile("file");
		MultipartFile sFile = req.getFile("subFile");
		String originalFilename = mFile.getOriginalFilename();
		String originalSubFilename = sFile.getOriginalFilename();
		System.out.println("file:"+originalFilename);
		System.out.println("subFile:"+originalSubFilename);
//		System.out.println("mFile:"+originalFilename);
		System.out.println("productVo:"+productVo);
		if(originalFilename!=null&&!originalFilename.equals("")) {
			AdminFileUploadUtil.delete(productVo.getPdt_image(), uploadPath+"/product",true);
			String dirPath = AdminFileUploadUtil.uploadFile(uploadPath+"/product", originalFilename, mFile.getBytes(),true);
			String path = dirPath.replace("\\", "/");
			productVo.setPdt_image(path);
			System.out.println("ori변경");
		}
		if(originalSubFilename!=null&&!originalSubFilename.equals("")) {
			AdminFileUploadUtil.delete(productVo.getPdt_subimage(), uploadPath+"/product",false);
			String dirPath = AdminFileUploadUtil.uploadFile(uploadPath+"/product", originalSubFilename, sFile.getBytes(),false);
			String path = dirPath.replace("\\", "/");
			productVo.setPdt_subimage(path);
			System.out.println("sub변경");
		}
		System.out.println(productVo);
		service.updatePDT(productVo);
		return "redirect:/admin/content?pdt_num="+productVo.getPdt_num();
	}
	
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String deletePDT(int pdt_num) throws Exception{
		ProductVo productVo = service.readPDT(pdt_num);
		String pdt_image = productVo.getPdt_image();
		String pdt_subimage = productVo.getPdt_subimage();
		AdminFileUploadUtil.delete(pdt_image,uploadPath+"/product",true);
		AdminFileUploadUtil.delete(pdt_subimage,uploadPath+"/product",false);
		service.deletePDT(pdt_num);
		
		return "redirect:/admin/list";
	}
	
	@RequestMapping(value = "/displayFile", method =  RequestMethod.GET)
	@ResponseBody
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		String realPath = uploadPath+"\\product" + File.separator + fileName.replace("/", "\\");
//		String realPath = "//192.168.0.34/upload/team2\\product\\d839fcf6-64a4-4ee5-ab1d-65061460b425_ddong.jpg".replace("/", "\\");
//		System.out.println("realPath:"+ realPath);
		FileInputStream is = new FileInputStream(realPath);
		byte[] bytes = IOUtils.toByteArray(is);
		is.close();
		return bytes;
	}
	
	@RequestMapping(value="orderList")
	public String orderList(Model model)throws Exception{
		List<BuyJoinDto> list = buyService.selectReadAll();
		List<ProductVo> proList = service.readAllPDT();
		List<BuyJoinDto> buyFirstlist = new ArrayList<BuyJoinDto>();
		int buy_num =0;
		for(BuyJoinDto buyJoinDto : list) {
			if(buyJoinDto.getBuy_num()!=buy_num) {
				buyFirstlist.add(buyJoinDto);
				buy_num = buyJoinDto.getBuy_num();
			}
		}
		
		model.addAttribute("buyFirstlist",buyFirstlist);
		model.addAttribute("proList",proList);
		model.addAttribute("buyList",list);
		return "/admin/orderList";
	}
	@RequestMapping(value="mlbList")
	public String mlbList(Model model)throws Exception{
		List<BuyMyVo> list = buyService.selectBuyMy();
		model.addAttribute("list",list);
		return "/admin/mlbList";
	}
}
