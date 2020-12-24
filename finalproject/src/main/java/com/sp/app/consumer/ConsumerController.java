package com.sp.app.consumer;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

@Controller("consumer.consumerController")
@RequestMapping(value = "/consumer/**")
public class ConsumerController {
	
	@Autowired
	private ConsumerService service;
	@Autowired
	private MyUtil myUtil;
	
//	고객센터 메인
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String mainForm(
				@RequestParam(value = "questionType", defaultValue = "1") String questionType,
				HttpServletRequest req,
				Model model
			) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("questionType", questionType);
		map.put("offset", 0);
		map.put("rows", 10);
		
		List<ConsumerFAQ> list = service.populList(map);
		
		
		model.addAttribute("list", list);
		return ".consumer.main";
	}
	
//	FAQ 등록
	@RequestMapping(value = "faq/created", method = RequestMethod.GET)
	public String faqCreatedForm() throws Exception {
		
		return "consumer/faq/created";
	}
	
	@RequestMapping(value = "faq/created", method = RequestMethod.POST)
	public String faqCreatedSubmit(
				ConsumerFAQ dto,
				HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertFAQ(dto);
		} catch (Exception e) {

		}
		
		
		return "redirect:/consumer/list";
	}
	
	
//	1:1 문의
	@RequestMapping(value = "qna/created", method = RequestMethod.GET)
	public String ceratedForm(Model model) throws Exception {
		
		return "consumer/qna/created";
	}
	
	@RequestMapping(value = "qna/created", method = RequestMethod.POST)
	public String createdSubmit(ConsumerQNA dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "consumer";
			
			dto.setUserId(info.getUserId());
			service.insertQna(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/consumer/myHistory";
	}
	
//	내문의내역
	@RequestMapping(value = "myHistory", method = RequestMethod.GET)
	public String myHistoryForm() throws Exception {
		
		return ".consumer.myHistory";
	}
	
//	자주하는 질문 리스트
	@RequestMapping(value = "list")
	public String listForm(
				@RequestParam(defaultValue = "1") String questionType,
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(defaultValue="") String keyword,
				HttpServletRequest req,
				Model model
			) throws Exception {
		int offset = 0;
		int rows = 10;
		int dataCount = 0;
		int total_page = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("questionType", questionType);
        map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		offset = (current_page - 1) * rows;
		if(offset < 0) {
			offset = 0;
		}
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<ConsumerFAQ> list = service.fqaList(map);
		
		int listNum, n = 0;
        for(ConsumerFAQ dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
        
        String cp = req.getContextPath();
        String listUrl = cp + "/consumer/list";
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
        model.addAttribute("keyword", keyword);
		model.addAttribute("questionType", questionType);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return ".consumer.list";
	}
	
	@RequestMapping(value = "updateReview")
	@ResponseBody
	public void updateReview(
				@RequestParam int num
			) throws Exception {
		service.updateReview(num);
	}
}
