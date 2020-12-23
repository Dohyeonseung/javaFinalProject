package com.sp.app.selltab.infor;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;

@Controller("selltab.infor.informationController")
@RequestMapping("/selltab/information/*")
public class InformationController {
	@Autowired
	private InformationService service;
	@Autowired
	private MyUtil myUtil;
	
	// 정보
	@RequestMapping(value="main")
	public String main(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int productNum,
			Model model) throws Exception{
		
		int rows=10;
		int total_page =0;
		int dataCount=0;
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("productNum", productNum);
		
		dataCount= service.dataCount(map);
		if(dataCount !=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page) 
            current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
        
        List<Information> list =service.listInformation(map);
        
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
        
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
        
		return "ms/tab/main";
		
	}
	
	@RequestMapping(value="review")
	public String review(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int productNum,
			Model model) throws Exception{

		return "ms/tab/review";
	}

	@RequestMapping(value="qna")
	public String qna(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int productNum,
			Model model) throws Exception{

		return "ms/tab/qna";
	}
	
}
