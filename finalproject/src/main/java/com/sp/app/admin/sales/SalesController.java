package com.sp.app.admin.sales;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("admin.sales.salesController")
@RequestMapping("/admin/adminSales/*")
public class SalesController {
	
	@Autowired
	private SalesService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="saleshome", method=RequestMethod.GET)
	public String main() {
		return ".admin.adminSales.adminSalesHome";
	}
	
	@RequestMapping(value="chart", method=RequestMethod.GET)
	public String statistics() {
		return ".admin.adminSales.sales_statistics";
	}
	
	@RequestMapping(value="productlist")
	public String productList(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue = "0") int categoryNum,
			HttpServletRequest req,
			Model model) throws Exception {
		
		 String cp = req.getContextPath();
	   	    
			int rows = 10; // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int dataCount = 0;
	   	    
			if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
				keyword = URLDecoder.decode(keyword, "utf-8");
			}
			
	        // 전체 페이지 수
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("categoryNum", categoryNum);
	        map.put("condition", condition);
	        map.put("keyword", keyword);

	        dataCount = service.dataCount(map);
	        if(dataCount != 0)
	            total_page = myUtil.pageCount(rows, dataCount) ;

	        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page) 
	            current_page = total_page;

	        // 리스트에 출력할 데이터를 가져오기
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);

	        // 글 리스트
	        List<Sales> list = service.listProduct(map);

	        // 리스트의 번호
	        int listNum, n = 0;
	        for(Sales dto : list) {
	            listNum = dataCount - (offset + n);
	            dto.setListNum(listNum);
	            n++;
	        }
	        
	        String query = "";
	        String listUrl = cp+"/admin/adminSales/productlist";
	        String articleUrl = cp+"/bbs/article?page=" + current_page;
	        if(keyword.length()!=0) {
	        	query = "condition=" +condition + 
	        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
	        }
	        
	        if(query.length()!=0) {
	        	listUrl = cp+"/admin/adminSales/productlist?" + query;
	        	articleUrl = cp+"//admin/adminSales/productinfo?page=" + current_page + "&"+ query;
	        }
	        
	        String paging = myUtil.paging(current_page, total_page, listUrl);

	        model.addAttribute("list", list);
	        model.addAttribute("articleUrl", articleUrl);
	        model.addAttribute("page", current_page);
	        model.addAttribute("dataCount", dataCount);
	        model.addAttribute("total_page", total_page);
	        model.addAttribute("paging", paging);
	        
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
			model.addAttribute("categoryNum", categoryNum);
			
		
		return ".admin.adminSales.productList";
	}
	

	// 상품 등록
	@RequestMapping(value = "registration", method = RequestMethod.POST)
	public String productCreatedSubmit(Sales dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		try {
			dto.setMemberIdx(info.getMemberIdx());
			dto.setUserId(info.getUserId());
			service.insertProduct(dto);
		} catch (Exception e) {
		}
		return "redirect:/admin/adminSales/productlist";
	}
	
	@RequestMapping(value="productinfo", method=RequestMethod.GET)
	public String productInfo(@RequestParam String productCode,
			@RequestParam String page, Model model) throws Exception {
		
		String query="page="+page;
		// 해당 레코드 가져 오기
		Sales dto = service.readProduct(productCode);
		if(dto==null)
			return "redirect:/admin/adminSales/productlist?"+query;
		
		List<Sales> listState = service.listProductState(productCode);
		
		
		listState = service.listProductState(productCode);
		// 스마트 에디터에서는 주석 처리
        // dto.setContent(myUtil.htmlSymbols(dto.getContent()));
        
        
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("listState", listState);

		return ".admin.adminSales.productInfo";
	}

	@RequestMapping(value = "adminProductDetaile")
	public String adminProductDetaile(@RequestParam String productCode, Model model) throws Exception {
		
		Sales dto = service.readProduct(productCode);
		Sales productState = service.readProductState(productCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("productState", productState);
		
		return "admin/adminSales/adminProductDetaile";
	}
	
	@RequestMapping(value = "updateProductState", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateProductState(Sales dto) throws Exception {
		
		String state = "true";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("productCode", dto.getProductCode());
			if(dto.getStateCode() == 0) {
				map.put("stateCode", 1);
			} else if(dto.getStateCode() == 0) {
				map.put("stateCode", 2);
			} else if(dto.getStateCode() == 0) {
				map.put("stateCode", 3);
			} else {
				map.put("stateCode", 0);
			}
			// 상태변경
			service.updateProductState(map);
			// 변경내용저장
			service.insertProductState(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	
	@RequestMapping(value="orderlist", method=RequestMethod.GET)
	public String orderList() {
		return ".admin.adminSales.orderList";
	}
	
	@RequestMapping(value="registration", method=RequestMethod.GET)
	public String productCrated() {
		return ".admin.adminSales.productRegistration";
	}
	
	
}
