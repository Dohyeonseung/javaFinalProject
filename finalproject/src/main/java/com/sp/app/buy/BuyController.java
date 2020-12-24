package com.sp.app.buy;

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

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("buy.buyController")
@RequestMapping("/buy/")
public class BuyController {
	@Autowired
	private BuyService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "material")
	public String product(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		int rows=8;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		
		dataCount=service.dataCount(map);
		
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page) {
			current_page=total_page;
		}
		
		int offset=(current_page-1)*rows;
		if(offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Product> list=service.listProduct(map);
		
		for(Product dto:list) {
			dto.setProductNum(dto.getProductNum());
		}
		
		String cp=req.getContextPath();
		String query="";
		String listUrl=cp+"/buy/material";
		String articleUrl=cp+"/buy/product?page="+current_page;
		if(query.length()!=0) {
			listUrl+="?"+query;
			articleUrl+="&"+query;
		}
		
		String paging=myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("material", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		
		return ".buy.material";
	}
	
	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String product(
			@RequestParam int productNum,
			@RequestParam String page,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Product dto = service.readProduct(productNum);
		if (dto == null)
			return "redirect:/buy/material?"+query;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNum", productNum);
		
		// dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		
		model.addAttribute("mode", "created");
		return ".buy.product";
	}

/*
	@RequestMapping(value = "purchase", method = RequestMethod.GET)
	public String productForm(Model model) throws Exception {
		
		return ".buy.purchase";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String insertOrderinfo(
			Orderinfo dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberIdx(info.getMemberIdx());
			service.insertOrderinfo(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/buy/material";
	}
*/
	

	
	@RequestMapping(value = "addcart", method = RequestMethod.POST)
	public String cartSubmit(
			Cart dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertCart(dto);
		} catch (Exception e) {
		}
		
		return ".buy.order.cart";
	}
	
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String Cart(
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		String userId=info.getUserId();
		
		Map<String, Object> map = new HashMap<>();
		
		List<Cart> list=service.listCart(map);
		
		for(Cart dto:list) {
			dto.setcId(dto.getcId());
		}
		
		String cp=req.getContextPath();
		String query="";
		String articleUrl=cp+"/buy/cart?userId="+userId;
		if(query.length()!=0) {
			articleUrl+="&"+query;
		}

		model.addAttribute("cart", list);
		model.addAttribute("articleUrl", articleUrl);
		
		
		return ".buy.order.cart";
	}
	
	@RequestMapping(value = "orderForm")
	public String orderForm(
			@RequestParam int productNum,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="";
		if(keyword.length()!=0) {
			query+="&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Product dto = service.readProduct(productNum);
		if (dto == null)
			return "redirect:/buy/product?"+query;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNum", productNum);
		
		// dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		
		return ".buy.order.order";
	}
	
	@RequestMapping(value = "orderSubmit", method = RequestMethod.POST)
	public String orderSubmit(
			Orderinfo dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setMemberIdx(info.getMemberIdx());
			service.insertOrderinfo(dto);
		} catch (Exception e) {
		}
		
		return ".buy.material";
	}
	
}
