package com.sp.app.qna;

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

@Controller("qna.qnaController")
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(value="rows", defaultValue="10") int rows,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int total_page = 0;
		int dataCount = 0;
		

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

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

		List<Qna> list = service.listQna(map);
		
		int listNum, n = 0;
        for(Qna dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
		String cp = req.getContextPath();
		String query = "rows="+rows;
		String listUrl = cp + "/qna/list";
		String articleUrl = cp + "/qna/article?page=" + current_page;

		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword="
					+ URLEncoder.encode(keyword, "UTF-8");
		}
		listUrl += "?" + query;
		articleUrl += "&" + query;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		model.addAttribute("rows", rows);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		return ".qna.list";
	}

	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(HttpSession session, Model model) throws Exception{
		model.addAttribute("mode", "created");
		return ".qna.created";
	}
	
	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(Qna dto, HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertQna(dto, "created");
		} catch (Exception e) {
		}
		
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value="article")
	public String article(
			@RequestParam int boardNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam int rows,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page+"&rows="+rows;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Qna dto=service.readQna(boardNum);
		
		if(dto==null) {
			return "redirect:/qna/list?"+query;
		}
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		// 이전/다음글
		Map<String, Object> map=new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		
		List<Qna> listArticle = service.listArticleQna(dto.getGroupNum());
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("rows", rows);
		model.addAttribute("page", page);
		model.addAttribute("listArticle", listArticle);
		
		return ".qna.article";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int boardNum,
			@RequestParam String page,
			@RequestParam int rows,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Qna dto=service.readQna(boardNum);
		if(dto==null || ! dto.getUserId().equals(info.getUserId())) {
			return "redirect:/qna/list?page="+page+"&rows="+rows;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("mode", "update");
		
		return ".qna.created";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			Qna dto,
			@RequestParam int rows,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.updateQna(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/qna/list?page="+page+"&rows="+rows;
	}
	
	@RequestMapping(value="reply", method=RequestMethod.GET)
	public String replyForm(
			@RequestParam int boardNum,
			@RequestParam String page,
			@RequestParam int rows,
			Model model
			) throws Exception {
		
		Qna dto=service.readQna(boardNum);
		if(dto==null) {
			return "redirect:/qna/list?page="+page+"&rows="+rows;
		}
		
		dto.setContent("["+dto.getSubject()+"] 에 대한 답변입니다.\n");
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("rows", rows);
		model.addAttribute("mode", "reply");
		
		return ".qna.created";
	}
	
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String replySubmit(
			Qna dto,
			@RequestParam int rows,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertQna(dto, "reply");
		} catch (Exception e) {
		}
		
		return "redirect:/qna/list?page="+page+"&rows="+rows;
	}
	
	@RequestMapping(value="delete")
	public String delete(
			@RequestParam int boardNum,
			@RequestParam String page,
			@RequestParam int rows,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String query=page+"&rows="+rows;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		try {
			service.deleteQna(boardNum, info.getUserId());
		} catch (Exception e) {
		}
		
		return "redirect:/qna/list?page="+query;
	}
}
