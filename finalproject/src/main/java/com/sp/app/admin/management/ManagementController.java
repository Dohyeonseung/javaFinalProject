package com.sp.app.admin.management;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller("admin.management.managementController")
@RequestMapping("/admin/management/*")
public class ManagementController {
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String memberList() {
		return ".admin.management.memberList";
	}
	
	@RequestMapping(value="info", method=RequestMethod.GET)
	public String memberinfo() {
		return ".admin.management.memberInfo";
	}
	
	// 회원상세 정보 : AJAX-Text 응답
	@RequestMapping(value="detaile")
	public String detaileMember(
			@RequestParam String userId,
			Model model) throws Exception {
		
		
		return "admin/management/detaile";
	}
}

