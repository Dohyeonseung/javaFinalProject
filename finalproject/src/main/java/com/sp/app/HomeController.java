package com.sp.app;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.app.buy.BuyService;
import com.sp.app.buy.Product;


@Controller
public class HomeController {
	@Autowired
	private BuyService service1;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			HttpServletRequest req
			) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("offset", 0);	
		map.put("rows", 10);	
	
		List<Product> list1=service1.listProduct_mat(map);
		List<Product> list2=service1.listProduct_complete(map);
		List<Product> list3=service1.listProduct_rsv(map);
		
		
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		return ".main.main";
	}
}
