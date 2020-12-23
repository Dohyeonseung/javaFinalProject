package com.sp.app.admin.authority;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.authority.authorityController")
@RequestMapping("/admin/authority/*")
public class authorityController {

	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String authorityList() {
		
		return ".admin.authority.salesAuthorityList";
	}
}
