package com.sp.app.admin.sales;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("admin.statisticsController")
@RequestMapping("/admin/adminSales/*")
public class SalesController {
	
	@RequestMapping(value="saleshome", method=RequestMethod.GET)
	public String main() {
		return ".admin.adminSales.adminSalesHome";
	}
	
	@RequestMapping(value="chart", method=RequestMethod.GET)
	public String statistics() {
		return ".admin.adminSales.sales_statistics";
	}
	
	@RequestMapping(value="productlist", method=RequestMethod.GET)
	public String productList() {
		return ".admin.adminSales.salesList";
	}
	
	@RequestMapping(value="enrollment", method=RequestMethod.GET)
	public String productCrated() {
		return ".admin.adminSales.productRegistration";
	}
	
	@RequestMapping(value="productinfo", method=RequestMethod.GET)
	public String productInfo() {
		return ".admin.adminSales.productInfo";
	}
}
