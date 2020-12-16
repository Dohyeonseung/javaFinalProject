package com.sp.app.notice;

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

@Controller("notice.noticeController")
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
        Map<String, Object> map = new HashMap<String, Object>();
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        if(total_page < current_page) 
            current_page = total_page;


        List<Notice> noticeList = null;
        if(current_page==1) {
          noticeList=service.listNoticeTop();
        }
        
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        List<Notice> list = service.listNotice(map);
        
        int num, n = 0;
        for(Notice dto : list) {
            num = dataCount - (offset  + n);
            dto.setNum(num);
            n++;
        }
        String cp=req.getContextPath();
        String listUrl = cp+"/notice/list";
        String articleUrl = cp+"/notice/article?page=" + current_page;
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		model.addAttribute("articleUrl", articleUrl);
		
		return ".notice.list";
	}
	
	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session
			) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:/notice/list";
		}
		
		model.addAttribute("mode", "created");
		
		return ".notice.created";
	}
	
	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/notice/list";	
		}

		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root +"notice";		
			
			dto.setUserId(info.getUserId());
			service.insertNotice(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value="article")
	public String article(
			@RequestParam int listNum,
			@RequestParam String page,
			Model model) throws Exception {
		
		String query="page="+page;
		
		service.updateHitCount(listNum);

		Notice dto = service.readNotice(listNum);
		if(dto==null) {
			return "redirect:/notice/list?"+query;
		}
		
        dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
         
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listNum", listNum);

		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
				
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".notice.article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int listNum,
			@RequestParam String page,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/notice/list?page="+page;
		}
		
		Notice dto = service.readNotice(listNum);
		if(dto==null) {
			return "redirect:/notice/list?page="+page;
		}
			
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
		return ".notice.created";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			Notice dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:/notice/list?page="+page;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "notice";		
			
			dto.setUserId(info.getUserId());
			service.updateNotice(dto, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/notice/list?page="+page;
	}
	
	@RequestMapping(value = "delete")
	public String delete(
			@RequestParam int listNum,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String query="page="+page;
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/notice/list?"+query;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "notice";
			service.deleteNotice(listNum, pathname);
		} catch (Exception e) {
		}
		
		return "redirect:/notice/list?"+query;
	}
}
