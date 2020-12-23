package com.sp.app.materialSell;

import java.io.File;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("ms.materialSellController")
@RequestMapping("/ms/*")
public class MaterialSellController {
	
	@Autowired
	private MaterialSellService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list") //주소뒷값이 list 이면
	   public String list(
			   @RequestParam(value="page", defaultValue="1") int current_page, //넘겨줄 값 
			   @RequestParam(defaultValue = "all")String condition,// condition 값이 없을때 디폴트값 all로 넘겨줌
			   @RequestParam(defaultValue = "")String keyword, // keyword값이 없을때 ""로 넘겨줌
			   HttpServletRequest req, //보내주는 객체
			   Model model
			   ) throws Exception {
		   
		   int rows=6;
		   int total_page=0;
		   int dataCount=0;
		   
		   if(req.getMethod().equalsIgnoreCase("GET")) {
			   keyword=URLDecoder.decode(keyword, "utf-8");
		   }
		   
		   Map<String, Object> map =new HashMap<>();
		   map.put("condition", condition);
		   map.put("keyword", keyword);
		   
		   dataCount=service.dataCount(map); //카운트 값 가져옴 
		   
		   if(dataCount!=0) {
			   total_page=myUtil.pageCount(rows, dataCount);//마이유틸에 페이지 전체페이지구하는 메소드
		   }
		   
		   if(total_page<current_page) {
			   current_page=total_page;
		   }
		   
		   int offset=(current_page-1)*rows;//현재 페이지 -1 *화면에 나오게할 게시물 수
		   if(offset<0) offset=0;
		   map.put("offset", offset);
		   map.put("rows", rows);
		   
		   List<MaterialSell> list=service.listMaterialSell(map); //게시물 리스트 가져옴
		   
		   //게시물 번호만들기
		   int listNum, n=0;
		   for(MaterialSell dto:list) {
			   listNum=dataCount-(offset+n);
			   dto.setListNum(listNum);
			   n++;
		   }
		   
		   String cp=req.getContextPath();//현제페이지의 뿌리주소
		   String query=""; //?
		   String listUrl=cp+"/ms/list"; //현재페이지의 주소설정
		   String articleUrl=cp+"/ms/article?page="+current_page;//아티클 페이지 주소설정
		   if(keyword.length()!=0) {//키워드가 값이 잇으면 쿼리 값에 검색값과 키워드 값을 넣어줘라
			   query="condition="+condition+"&keyword="
					   +URLEncoder.encode(keyword, "utf-8");
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
		   model.addAttribute("condition",condition);
		   model.addAttribute("keyword",keyword);
		   

	      return ".ms.list";
	   }
	
	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<MaterialSell> listCategory=service.listCategory(map);
		
		// map.put("mode", "all");
		// List<Faq> listAllCategory=service.listCategory(map);
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		model.addAttribute("listCategory", listCategory);
		// model.addAttribute("listAllCategory", listAllCategory);

		return ".ms.created";
	}
	   
	   @PostMapping("created") //포스트 방식 크리에티드
	   public String createdSubmit(MaterialSell dto, 
			   HttpServletRequest req,
			   HttpSession session) throws Exception {
	      
	      SessionInfo info = (SessionInfo)session.getAttribute("member"); //세션에 저장한 멤버 목록 가져옴
	      
	      String root = session.getServletContext().getRealPath("/");//웹 어플리케이션 상의 절대경로
	      String pathname = root+"uploads"+File.separator+"ms";
	      
	      try {
	         dto.setUserId(info.getUserId());//세션에 등록되있는 아이디를가져와 dto에 UserId에 배치
	         service.insertMaterialSell(dto, pathname);//db에 등록
	         
	       } catch (Exception e) {
	      }
	      
	      return "redirect:/ms/list";//리스트 페이지로 오기
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
		 
		   MaterialSell dto=service.readMaterialSell(productNum);
		   
		   if(dto==null) {
			   return "redirect:/ms/list?"+query;
		   }
		   
		   Map<String, Object> map=new HashMap<>();
		   map.put("productNum", productNum);
		   map.put("condition", condition);
		   map.put("keyword", keyword);
		   
		 
		   
		   model.addAttribute("dto", dto);
		   model.addAttribute("page", page);
		   model.addAttribute("query", query);
		   
		   model.addAttribute("menuItem", "main");
		   
		   return ".ms.article";
	   }
	   
	   @GetMapping("update")
	public String updateForm(
			@RequestParam int productNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception{
		   
		   SessionInfo info=(SessionInfo)session.getAttribute("member");
		   MaterialSell dto=service.readMaterialSell(productNum);
	
		   if(dto==null) {
			   return "redirect:/ms/list?page="+page;
		   }
		   
		   if(! dto.getUserId().equals(info.getUserId())) {
				return "redirect:/ms/list?page="+page;
			}
		   
		   model.addAttribute("dto", dto);
		   model.addAttribute("mode","update");
		   model.addAttribute("page", page);
		   
		   return ".ms.created";
	   }
	   
	   @PostMapping("update")
	   public String updateSubmit(
			   MaterialSell dto,
			   @RequestParam String page,
			   HttpSession session
			   ) throws Exception{
		  String root=session.getServletContext().getRealPath("/");
		  String pathname=root+"uploads"+File.separator+"photo";
		   
		   try {
			  service.updateMaterialSell(dto, pathname);
		} catch (Exception e) {
		}
		   return "redirect:/ms/list?page="+page;
	   }	 
	   
	   @RequestMapping(value="delete", method=RequestMethod.GET)
	   public String delete(
			   @RequestParam int productNum, 
			   @RequestParam (defaultValue="1") String page, 
			   @RequestParam(defaultValue="all") String condition,
			   @RequestParam(defaultValue = "") String keyword, 
			   HttpSession session
			   ) throws Exception{
		   
		   	  keyword = URLDecoder.decode(keyword, "UTF-8");
		      String query = "page="+page;
		      if(keyword.length()!=0) {
		      query += "&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		      }
		      
		      String root=session.getServletContext().getRealPath("/");
			  String pathname=root+"uploads"+File.separator+"ms";
		      
		      SessionInfo info = (SessionInfo)session.getAttribute("member");
		      try {
					service.deleteMaterialSell(productNum, pathname, info.getUserId());
				} catch (Exception e) {
				}
	
		   
		   return "redirect:/ms/list?"+query;
	   }
}
