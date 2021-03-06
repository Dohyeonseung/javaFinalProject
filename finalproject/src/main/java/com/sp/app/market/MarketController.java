package com.sp.app.market;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("market.marketController")
@RequestMapping("/market/**")
public class MarketController {

	@Autowired
	private MyUtil myUtil;

	@Autowired
	private MarketService service;

	@RequestMapping(value = "list")
	public String marketmain(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 9;
		int total_page;
		int dataCount;

		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

		List<Market> list = service.listSales(map);

		// 글번호 만들기
		int listNum, n = 0;
		for(Market dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}

        String query = "";
        String listUrl = cp+"/market/list";
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/market/list?" + query;
        }
		
        String paging = myUtil.paging(current_page, total_page, listUrl);
        		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".market.list";
	}
	
	
	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String article(@RequestParam String productCode, @RequestParam String page, Model model) throws Exception {
		
		
		Market dto =service.readSales(productCode);
		if(dto == null)
			return "redirect:/market/list";
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		
		return ".market.product";
	}
	
	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String orderProduct(@RequestParam String productCode, @RequestParam long memberIdx, @RequestParam int buyCount, @RequestParam String page, Model model, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Market dto = service.readOrder(productCode, buyCount);
		memberIdx = info.getMemberIdx();
		if(dto == null)
			return "redirect:/market/list";
		
		model.addAttribute("dto", dto);
		model.addAttribute("memberIdx", memberIdx);
		model.addAttribute("page", page);
		
		return ".market.orderProduct";
	}
	
	
	@RequestMapping(value = "order", method = RequestMethod.POST)
	public String orderProductSubmit(Market dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			dto.setMemberIdx(info.getMemberIdx());
			dto.setOrderAddress(dto.getAddr1()+dto.getAddr2());
			dto.setOrderTel(dto.getTel1()+dto.getTel2()+dto.getTel3());
			dto.setOrderTel2(dto.getsTel1()+dto.getsTel2()+dto.getsTel3());
			dto.setAmountPrice(dto.getTotalPrice()+dto.getCost());
			map.put("buyCount", dto.getBuyCount());
			map.put("productCode", dto.getProductCode());
			service.insertProductOrder(dto);
			service.updateProductCount(map);
		} catch (Exception e) {
		}
		
		return ".market.orderComplete";
	}

}
