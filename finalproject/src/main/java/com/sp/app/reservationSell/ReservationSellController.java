package com.sp.app.reservationSell;

import java.io.File;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("rv.reservationSellController")
@RequestMapping("/rv/*")
public class ReservationSellController {
	@Autowired
	private ReservationSellService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue = "new")String sortCol, 
			@RequestParam(defaultValue = "")String keyword,
			HttpServletRequest req,
			 HttpSession session,
			Model model) throws Exception{
		
		int rows= 10;
		int total_page = 0;
		int dataCount = 0;
		
		 if(req.getMethod().equalsIgnoreCase("GET")) {
			   keyword=URLDecoder.decode(keyword, "utf-8");
		   }
		 SessionInfo info=(SessionInfo) session.getAttribute("member");
		 String userId=info.getUserId();
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("sortCol", sortCol);
	     map.put("keyword", keyword);
	     map.put("userId", userId);

	     
	     dataCount = service.dataCount(map);
	       if(dataCount != 0)
	      total_page = myUtil.pageCount(rows,  dataCount) ;
	       
	       // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page) 
	            current_page = total_page;
	        
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        
	        List<ReservationSell> list = service.listReservationSell(map);
	        
	      //게시물 번호만들기
			   int listNum, n=0;
			   for(ReservationSell dto:list) {
				   listNum=dataCount-(offset+n);
				   dto.setListNum(listNum);
				   n++;
			   }
			   
			   String cp=req.getContextPath();//현제페이지의 뿌리주소
			   String query=""; //?
			   String listUrl=cp+"/cp/list"; //현재페이지의 주소설정
			   String articleUrl=cp+"/cp/article?page="+current_page;//아티클 페이지 주소설정
			   if(keyword.length()!=0) {//키워드가 값이 잇으면 쿼리 값에 검색값과 키워드 값을 넣어줘라
				   query="keyword="+URLEncoder.encode(keyword, "utf-8");
			   }
			   if(query.length()!=0) {//위에서 정의한 쿼리가 값이 있을경우
				   listUrl+="?"+query; //리스트 유알엘에 쿼리값 추가
				  articleUrl+="&"+query;//아티클도 마찬가지
			   }
			   
			   String paging=myUtil.paging(current_page, total_page, listUrl);
			   
			   model.addAttribute("list",list);
			   model.addAttribute("articleUrl",articleUrl);
			   model.addAttribute("page", current_page);
			   model.addAttribute("dataCount",dataCount);
			   model.addAttribute("total_page",total_page);
			   model.addAttribute("paging",paging);
			   model.addAttribute("sortCol",sortCol);
			   model.addAttribute("keyword",keyword);
			   

		      return ".rv.list";
	}
	
	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<ReservationSell> listCategory=service.listCategory(map);
		
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		model.addAttribute("listCategory", listCategory);

		return ".rv.created";
	}
	
	@PostMapping("created") //포스트 방식 크리에티드
	   public String createdSubmit(ReservationSell dto, 
			   HttpServletRequest req,
			   HttpSession session) throws Exception {
		 SessionInfo info = (SessionInfo)session.getAttribute("member");
		 String root = session.getServletContext().getRealPath("/");//웹 어플리케이션 상의 절대경로
	      String pathname = root+"uploads"+File.separator+"rv";
	      
	      try {
	    	  dto.setUserId(info.getUserId());//세션에 등록되있는 아이디를가져와 dto에 UserId에 배치
		         service.insertReservationSell(dto, pathname);
		} catch (Exception e) {
		}
	      
	      return "redirect:/rv/list";
	}
	
	 @GetMapping("article")
	   public String article(
			   @RequestParam int productNum,
			   @RequestParam String page,
			   @RequestParam(defaultValue="all") String condition,
			   @RequestParam(defaultValue="") String keyword,
			   Model model
			   ) throws Exception{
		   keyword=URLDecoder.decode(keyword, "utf-8");
		   
		   
		   String query="page="+page;
		   if(keyword.length()!=0) {
			   query+="&condition="+condition+"&keyword"+
					   URLEncoder.encode(keyword, "utf-8");
		   }
		 
		   ReservationSell dto=service.readReservationSell(productNum);
		   if(dto==null) {
			   return "redirect:/rv/list?"+query;
		   }
		   List<String> listImage = new ArrayList<String>();
		   listImage = myUtil.getImgSrc(dto.getContent());
		   
		   Map<String, Object> map=new HashMap<>();
		   map.put("productNum", productNum);
		   map.put("condition", condition);
		   map.put("keyword", keyword);
		   
		   model.addAttribute("dto", dto);
		   model.addAttribute("page", page);
		   model.addAttribute("query", query);
		   model.addAttribute("listImage", listImage);
		   
		   model.addAttribute("menuItem", "main");
		   
		   return ".rv.article";
	   }
	 
	 @GetMapping("update")
		public String updateForm(
				@RequestParam int productNum,
				@RequestParam String page,
				HttpSession session,
				Model model
				) throws Exception{
			   
			   SessionInfo info=(SessionInfo)session.getAttribute("member");
			   ReservationSell dto=service.readReservationSell(productNum);
		
			   if(dto==null) {
				   return "redirect:/rv/list?page="+page;
			   }
			   
			   if(! dto.getUserId().equals(info.getUserId())) {
					return "redirect:/rv/list?page="+page;
				}
			   
			   model.addAttribute("dto", dto);
			   model.addAttribute("mode","update");
			   model.addAttribute("page", page);
			   
			   return ".cp.created";
		   }
		   
		   @PostMapping("update")
		   public String updateSubmit(
				   ReservationSell dto,
				   @RequestParam String page,
				   HttpSession session
				   ) throws Exception{
			  String root=session.getServletContext().getRealPath("/");
			  String pathname=root+"uploads"+File.separator+"rv";
			   
			   try {
				  service.updateReservationSell(dto, pathname);
			} catch (Exception e) {
			}
			   return "redirect:/rv/list?page="+page;
		   }
		   
		   @RequestMapping(value="delete", method=RequestMethod.GET)
		   public String delete(
				   @RequestParam int productNum, 
				   @RequestParam (defaultValue="1") String page, 
				   @RequestParam(defaultValue = "") String keyword, 
				   HttpSession session
				   ) throws Exception{
			   
			   	  keyword = URLDecoder.decode(keyword, "UTF-8");
			      String query = "page="+page;
			      if(keyword.length()!=0) {
			      query += "&keyword="+URLEncoder.encode(keyword, "UTF-8");
			      }
			      
			      String root=session.getServletContext().getRealPath("/");
				  String pathname=root+"uploads"+File.separator+"rv";
			      
			      SessionInfo info = (SessionInfo)session.getAttribute("member");
			      try {
						service.deleteReservationSell(productNum, pathname, info.getUserId());
					} catch (Exception e) {
					}
		
			   
			   return "redirect:/rv/list?"+query;
		   }
}
