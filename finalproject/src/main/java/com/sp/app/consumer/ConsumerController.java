package com.sp.app.consumer;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("consumer.consumerController")
@RequestMapping(value = "/consumer/**")
public class ConsumerController {
	
	@Autowired
	private ConsumerService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String ceratedForm(Model model) throws Exception {
		
		return "consumer/qna/created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(ConsumerQNA dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "false";
		
		if(info.getUserId().equals("admin")) {
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "consumer";
				
				dto.setUserId(info.getUserId());
				service.insertQna(dto, pathname);
				state = "true";
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
}
