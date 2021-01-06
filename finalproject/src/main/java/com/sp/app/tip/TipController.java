package com.sp.app.tip;

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
	        List<Tip> listCategory = service.listCategory(map);
	        int num, n = 0;
			for(Tip dto : list) {
				num = dataCount - (offset + n);
				dto.setNum(num);
				n++;
			}
			
			String query = "";
	        String listUrl = cp+"/tip/main";
	        String articleUrl = cp+"/tip/article?page=" + current_page;
	        if(keyword.length()!=0) {
	        	query = "condition=" +condition + 
	        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
	        }
	        
	        if(query.length()!=0) {
	        	listUrl = cp+"/tip/main?" + query;
	        	articleUrl = cp+"/tip/article?page=" + current_page + "&"+ query;
	        }
	        
	        String paging = myUtil.paging(current_page, total_page, listUrl);
	        
	        model.addAttribute("list", list);
	        model.addAttribute("listCategory", listCategory);
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
			
			Map<String, Object> map = new HashMap<>();
			List<Tip> listCategory=service.listCategory(map);
			
			model.addAttribute("listCategory", listCategory);	
			model.addAttribute("mode", "created");
			return ".tip.created";
		}
		
		@RequestMapping(value="created", method=RequestMethod.POST)
		public String createdSubmit(
				Tip dto,
				HttpSession session) throws Exception {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"tip";
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			try {
				dto.setUserId(info.getUserId());
				service.insertTip(dto, pathname);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			return "redirect:/tip/main";
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

			Tip dto = service.readTip(listNum);
			if(dto==null)
				return "redirect:/tip/list?"+query;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			map.put("num", listNum);
	        
			model.addAttribute("dto", dto);
			model.addAttribute("page", page);
			model.addAttribute("query", query);

	        return ".tip.article";
		}
		
		@RequestMapping(value="delete")
		public String deleteTip(
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
			String pathname=root+"uploads"+File.separator+"tip";
			
			service.deleteTip(listNum, pathname, info.getUserId());
			
			return "redirect:/tip/main?"+query;
		}
		
		@RequestMapping(value="update", method=RequestMethod.GET)
		public String updateForm(
				@RequestParam int listNum,
				@RequestParam String page,
				HttpSession session,
				Model model) throws Exception {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			Tip dto = service.readTip(listNum);
			if(dto==null) {
				return "redirect:/tip/main?page="+page;
			}

			if(! info.getUserId().equals(dto.getUserId())) {
				return "redirect:/tip/main?page="+page;
			}
			Map<String, Object> map = new HashMap<>();
			List<Tip> listCategory=service.listCategory(map);
			
			model.addAttribute("listCategory", listCategory);
			model.addAttribute("dto", dto);
			model.addAttribute("mode", "update");
			model.addAttribute("page", page);
			
			return ".tip.created";
		}
		
		@RequestMapping(value="update", method=RequestMethod.POST)
		public String updateSubmit(
				Tip dto, 
				@RequestParam String page,
				HttpSession session) throws Exception {
			
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"tip";		

			try {
				service.updateTip(dto, pathname);
			} catch (Exception e) {
				
			}
			
			return "redirect:/tip/article?listNum="+dto.getListNum()+"&page="+page;
		}
		
		@RequestMapping(value="listAllCategory", method=RequestMethod.GET)
		public String CategoryUpdateForm(
				Model model
				) throws Exception {
			Map<String, Object> map = new HashMap<>();
			List<Tip> listCategory=service.listCategory(map);
			model.addAttribute("listAllCategory", listCategory);
			
			return ".tip.listAllCategory";
		}
		
		@RequestMapping(value="insertCategory", method=RequestMethod.POST)
		public String insertCategory(
				Tip dto) throws Exception {
			try {
				service.insertCategory(dto);
			} catch (Exception e) {
			}
			return "redirect:/tip/listAllCategory";
		}
		
		@RequestMapping(value="deleteCategory")
		public String deleteCategory(
				@RequestParam int categoryNum
				) throws Exception {
			try {
				service.deleteCategory(categoryNum);
			} catch (Exception e) {
			}
			return "redirect:/tip/listAllCategory";
		}
		
		@RequestMapping(value="listCategory")
		public Map<String, Object> listCategory(
				@RequestParam String mode
				) throws Exception {
			Map<String, Object> map = new HashMap<>();
			List<Tip> listCategory=service.listCategory(map);
			
			Map<String, Object> model = new HashMap<>();
			model.put("listCategory", listCategory);
			return model;
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
			
			return "tip/listReply";
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
			return "tip/listReplyAnswer";
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
		
		@RequestMapping(value="insertTipLike", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertTipLike(
				@RequestParam int listNum,
				HttpSession session
				) {
			String state="true";
			int tipLikeCount=0;
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			Map<String, Object> paramMap=new HashMap<>();
			paramMap.put("listNum", listNum);
			paramMap.put("userId", info.getUserId());
			
			try {
				service.insertTipLike(paramMap);
			} catch (Exception e) {
				state="false";
			}
				
			tipLikeCount = service.tipLikeCount(listNum);
			
			Map<String, Object> model=new HashMap<>();
			model.put("state", state);
			model.put("tipLikeCount", tipLikeCount);
			
			return model;
		}
		
}
