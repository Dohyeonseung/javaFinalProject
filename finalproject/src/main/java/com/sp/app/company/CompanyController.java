package com.sp.app.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("company.companyController")
@RequestMapping("/company/*")
public class CompanyController {
	
	@RequestMapping(value = "company", method=RequestMethod.GET)
	public String company() throws Exception {
		
		return ".company.company";
	}
	
	@RequestMapping(value = "ethics", method = RequestMethod.GET)
	public String ethics() throws Exception {
		
		return ".company.ethics";
	}
}
