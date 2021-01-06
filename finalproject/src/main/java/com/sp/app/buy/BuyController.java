package com.sp.app.buy;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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

@Controller("buy.buyController")
@RequestMapping("/buy/")
public class BuyController {
	@Autowired
	private BuyService service;
	@Autowired
	private MyUtil myUtil;
	

	@RequestMapping(value = "material")
	public String product(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
        map.put("keyword", keyword);
		
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
		if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
		if(query.length()!=0) {
			listUrl = cp+"/buy/material?" + query;
			articleUrl = cp+"/buy/material?page=" + current_page + "&"+ query;
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
		
		List<String> listImage = new ArrayList<String>();
		listImage = myUtil.getImgSrc(dto.getContent());

		// dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("listImage", listImage);
		model.addAttribute("menuItem", "main");
		model.addAttribute("mode", "created");
		return ".buy.product";
	}
	
	@RequestMapping(value = "addcart", method = RequestMethod.POST)
	public String cartSubmit(
			Cart dto,
			Model model,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertCart(dto);
		}
		catch (Exception e) {
		}
		
		return "redirect:/buy/material";
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
		map.put("userId", userId);
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
	
	@RequestMapping(value = "deleteCart")
	public String deleteCart(
			@RequestParam int cId
			) throws Exception {
		
		try {
			service.deleteCart(cId);
		} catch (Exception e) {
		}
		
		return "redirect:/buy/cart";
	}
	
	@RequestMapping(value = "deleteCartlist")
	public String deleteCartlist(
			@RequestParam List<String> cIds
			) throws Exception {
		try {
			service.deleteCart(cIds);
		} catch (Exception e) {
		}
		
		return "redirect:/buy/cart";
	}
	
	@RequestMapping(value = "orderForm")
	public String orderForm(
			@RequestParam int productNum,
			@RequestParam int count,
			Model model
			) throws Exception {
		
		Product dto = service.readProduct(productNum);
		if (dto == null) {
			return "redirect:/buy/product";
		}
		dto.setCount(count);
		
		int total=0;
		int reserves=0;
		
		total+=(dto.getPrice()*dto.getCount())+2500;
		reserves+=(dto.getReserves()*dto.getCount());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNum", productNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("total", total);
		model.addAttribute("reserves", reserves);
		
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
		
		return "redirect:/buy/orderCheck";
	}
	
	@RequestMapping(value = "orderCart", method = RequestMethod.POST)
	public String orderCart(
			@RequestParam List<String> cIds,
			Model model,
			HttpSession session
			) throws Exception {
		
		try {
			List<Cart> listCart = service.listCart(cIds);
			int total=0;
			int reserves=0;
			for(Cart dto:listCart) {
				total+=(dto.getcPrice()*dto.getCount())+2500;
				reserves+=(dto.getReserves()*dto.getCount());
			}
			
			model.addAttribute("listCart", listCart);
			model.addAttribute("total", total);
			model.addAttribute("reserves", reserves);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".buy.order.order";
	}
	
	@RequestMapping(value = "orderCheck")
	public String orderCheck(
			HttpServletRequest req,
			Model model,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		
		long memberIdx=info.getMemberIdx();
		
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", memberIdx);
		List<Orderinfo> list=service.listOrder(map);
		
		for(Orderinfo dto:list) {
			dto.setOrderId(dto.getOrderId());
		}
		
		model.addAttribute("order", list);

		return ".buy.order.orderCheck";
		
	}
	
	

	
}
