package com.sp.app.tip;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;

@Controller("tip.tipController")
@RequestMapping("/tip/*")
public class TipController {
		
		@Autowired
		private TipService service;
		@Autowired
		private MyUtil myUtil;
		
		@RequestMapping(value="main")
		public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="0") int categoryNum,
				HttpServletRequest req,
				Model model
				) throws Exception {
			String cp = req.getContextPath();
			
			int rows = 6;
			int total_page;
			int dataCount;
			
			if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
				keyword = URLDecoder.decode(keyword, "utf-8");
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
	        map.put("condition", condition);
	        map.put("keyword", keyword);
	        map.put("categoryNum", categoryNum);
	        
	        dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(rows, dataCount);
			
			if (total_page < current_page)
				current_page = total_page;

	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        
	        List<Tip> list = service.listTip(map);
	        
	        int listNum, n = 0;
			for(Tip dto : list) {
				listNum = dataCount - (offset + n);
				dto.setListNum(listNum);
				n++;
			}
			
			String query = "";
	        String listUrl = cp+"/tip/list";
	        String articleUrl = cp+"/tip/article?page=" + current_page;
	        if(keyword.length()!=0) {
	        	query = "condition=" +condition + 
	        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
	        }
	        
	        if(query.length()!=0) {
	        	listUrl = cp+"/tip/list?" + query;
	        	articleUrl = cp+"/tip/article?page=" + current_page + "&"+ query;
	        }
	        
	        String paging = myUtil.paging(current_page, total_page, listUrl);
	        
	        model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
			model.addAttribute("categoryNum", categoryNum);
			
			return ".tip.list";
		}
		@RequestMapping(value="created", method=RequestMethod.GET)
		public String createdForm(Model model) throws Exception {
			
			model.addAttribute("mode", "created");
			return ".tip.created";
		}
}
