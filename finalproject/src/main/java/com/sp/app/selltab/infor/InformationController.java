package com.sp.app.selltab.infor;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;


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
		
		int rows=5;
		int total_page =0;
		int dataCount=0;
		
		Map<String, Object> map =new HashMap<>();
		map.put("productNum", productNum);
		
		dataCount = service.QnaCount(map);
		if(dataCount !=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page) 
            current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
        
        List<Review> list =service.listReview(map);
        
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
        
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "ms/tab/review";
	}

	@RequestMapping(value="qna")
	public String qna(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam int productNum,
			Model model) throws Exception{
		
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("productNum", productNum);
		
		dataCount=service.dataCountReview(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		List<Qna> listQna=service.listQna(map);
		
		for(Qna dto : listQna) {
			dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
		}
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listQna", listQna);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		return "ms/tab/qna";
	}
	
	// 답변및답변삭제
	@RequestMapping(value="answerQna", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> answerQna(
			Qna dto,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setSellerId(info.getUserId());
			service.answerQna(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
