package com.sp.app.admin.bbsManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbsManagement.boardController")
@RequestMapping("/admin/bbsManagement/*")
public class BoardController {
	
	@RequestMapping(value = "deck")
	public String controllMain( ) {
		
		return ".admin.bbsManagement.bbsManagement";
	}

}
