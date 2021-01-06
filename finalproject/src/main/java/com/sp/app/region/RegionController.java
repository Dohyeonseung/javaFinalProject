package com.sp.app.region;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("region.regionController")
@RequestMapping("/region/*")
public class RegionController {
		
		@Autowired
		private RegionService service;
		@Autowired
		private MyUtil myUtil;
		
		@RequestMapping(value="main")
		public String list(
				@RequestParam(value="page", defaultValue="1") int current_page,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="0") int region,
				HttpServletRequest req,
				Model model
				) throws Exception {
			String cp = req.getContextPath();
			
			
			int rows = 6;
			int total_page;
			int dataCount;
			
			
			if(req.getMethod().equalsIgnoreCase("GET")) { 
				keyword = URLDecoder.decode(keyword, "utf-8");
			}
			
			Map<String, Object> map = new HashMap<String, Object>();

	        map.put("condition", condition);
	        map.put("keyword", keyword);
	        map.put("region", region);
	        
	        dataCount = service.dataCount(map);
			total_page = myUtil.pageCount(rows, dataCount);
			
			if (total_page < current_page)
				current_page = total_page;

	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        
	        List<Region> list = service.listregion(map);
	        int num, n = 0;
			for(Region dto : list) {
				num = dataCount - (offset + n);
				dto.setNum(num);
				n++;
			}
			
			String query = "";
	        String listUrl = cp+"/region/main";
	        String articleUrl = cp+"/region/article?page=" + current_page;
	        if(keyword.length()!=0) {
	        	query = "condition=" +condition + 
	        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
	        }
	        
	        if(query.length()!=0) {
	        	listUrl = cp+"/region/main?" + query;
	        	articleUrl = cp+"/region/article?page=" + current_page + "&"+ query;
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
			
			return ".region.list";
		}
		
		@RequestMapping(value="created", method=RequestMethod.GET)
		public String createdForm(Model model) throws Exception {
			
			model.addAttribute("mode", "created");
			return ".region.created";
		}
		
		@RequestMapping(value="created", method=RequestMethod.POST)
		public String createdSubmit(
				Region dto,
				HttpSession session) throws Exception {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"region";
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			try {
				dto.setUserId(info.getUserId());
				service.insertregion(dto, pathname);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			return "redirect:/region/main";
		}
		
		@RequestMapping(value="article")
		public String article(
				@RequestParam int listNum,
				@RequestParam String page,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				Model model) throws Exception {
			
			keyword = URLDecoder.decode(keyword, "utf-8");
			
			String query="page="+page;
			if(keyword.length()!=0) {
				query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
			}

			Region dto = service.readregion(listNum);
			if(dto==null)
				return "redirect:/region/list?"+query;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			map.put("num", listNum);
	        
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("query", query);

	        return ".region.article";
		}
		
		@RequestMapping(value="delete")
		public String deleteregion(
				@RequestParam int listNum,
				@RequestParam String page,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				HttpSession session) throws Exception {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			keyword = URLDecoder.decode(keyword, "utf-8");
			String query="page="+page;
			if(keyword.length()!=0) {
				query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
			}
			
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"region";
			
			service.deleteregion(listNum, pathname, info.getUserId());
			
			return "redirect:/region/main?"+query;
		}
		
		@RequestMapping(value="update", method=RequestMethod.GET)
		public String updateForm(
				@RequestParam int listNum,
				@RequestParam String page,
				HttpSession session,
				Model model) throws Exception {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			Region dto = service.readregion(listNum);
			if(dto==null) {
				return "redirect:/region/main?page="+page;
			}

			if(! info.getUserId().equals(dto.getUserId())) {
				return "redirect:/region/main?page="+page;
			}
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			
			return ".region.created";
		}
		
		@RequestMapping(value="update", method=RequestMethod.POST)
		public String updateSubmit(
				Region dto, 
				@RequestParam String page,
				HttpSession session) throws Exception {
			
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"region";		

			try {
				service.updateregion(dto, pathname);
			} catch (Exception e) {
				
			}
			
			return "redirect:/region/article?listNum="+dto.getListNum()+"&page="+page;
		}
		
		@RequestMapping(value="listReply")
		public String listReply(
				@RequestParam int listNum,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				Model model
				) throws Exception {
			
			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map=new HashMap<>();
			map.put("listNum", listNum);
			
			dataCount=service.replyCount(map);
			total_page = myUtil.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
			List<Reply> listReply=service.listReply(map);
			
			for(Reply dto : listReply) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
			String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
			
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			return "region/listReply";
		}
		
		@RequestMapping(value="insertReply", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertReply(
				Reply dto,
				HttpSession session
				) {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String state="true";
			
			try {
				dto.setUserId(info.getUserId());
				service.insertReply(dto);
			} catch (Exception e) {
				state="false";
			}
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}
		
		@RequestMapping(value="deleteReply", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> deleteReply(
				@RequestParam Map<String, Object> paramMap
				) {
			
			String state="true";
			try {
				service.deleteReply(paramMap);
			} catch (Exception e) {
				state="false";
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("state", state);
			return map;
		}
		
		@RequestMapping(value="listReplyAnswer")
		public String listReplyAnswer(
				@RequestParam int answer,
				Model model
				) throws Exception {
			
			List<Reply> listReplyAnswer=service.listReplyAnswer(answer);
			for(Reply dto : listReplyAnswer) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
			model.addAttribute("listReplyAnswer", listReplyAnswer);
			return "region/listReplyAnswer";
		}
		
		@RequestMapping(value="countReplyAnswer")
		@ResponseBody
		public Map<String, Object> countReplyAnswer(
				@RequestParam(value="answer") int answer
				) {
			
			int count=service.replyAnswerCount(answer);
			
			Map<String, Object> model=new HashMap<>();
			model.put("count", count);
			return model;
		}
		
		@RequestMapping(value="insertRegionLike", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertregionLike(
				@RequestParam int listNum,
				HttpSession session
				) {
			String state="true";
			int regionLikeCount=0;
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			Map<String, Object> paramMap=new HashMap<>();
			paramMap.put("listNum", listNum);
			paramMap.put("userId", info.getUserId());
			
			try {
				service.insertregionLike(paramMap);
			} catch (Exception e) {
				state="false";
			}
				
			regionLikeCount = service.regionLikeCount(listNum);
			
			Map<String, Object> model=new HashMap<>();
			model.put("state", state);
			model.put("regionLikeCount", regionLikeCount);
			
			return model;
		}
		
}
