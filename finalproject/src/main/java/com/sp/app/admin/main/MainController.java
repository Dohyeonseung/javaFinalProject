package com.sp.app.admin.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.mainController")
@RequestMapping("/admin/*")
public class MainController {
	 
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String main() {
		return ".admin.adminHome";
	}

	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("member");
		
		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
}
