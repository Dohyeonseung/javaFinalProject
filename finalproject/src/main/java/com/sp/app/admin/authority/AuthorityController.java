package com.sp.app.admin.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.consumer.SellerInfo;

@Controller("admin.authority.authorityController")
@RequestMapping("/admin/authority/*")
public class AuthorityController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private AuthorityService service;
	
	@RequestMapping(value = "sellerList")
	public String listForm(
				Model model, 
				@RequestParam(defaultValue = "1") int current_page,
				HttpServletRequest req
				) throws Exception {
		List<SellerInfo> list = null;
		int offset = 0;
		int dataCount = 0;
		int waitDataCount = 0;
		int rows = 10;
		int total_page = 0;
		
		waitDataCount = service.sellerListCount(0);
		dataCount = service.sellerListCount(1);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		offset = (current_page - 1) * rows;
		
		if(offset < 0) {
			offset = 0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("rows", rows);
		
		list = service.sellerList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/admin/authority/sellerList";

		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("waitDataCount", waitDataCount);
		model.addAttribute("paging", paging);
		
		return ".admin.authority.salesAuthorityList";
	}
	
	@RequestMapping(value = "sellerChange")
	public String sellerChangeSubject(
				@RequestParam String userId,
				@RequestParam int state
			) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("state", state);
		
		service.sellerChange(map);
		
		return "redirect:/admin/authority/sellerList";
	}
}
