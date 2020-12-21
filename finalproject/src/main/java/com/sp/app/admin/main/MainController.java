package com.sp.app.admin.main;

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
}
