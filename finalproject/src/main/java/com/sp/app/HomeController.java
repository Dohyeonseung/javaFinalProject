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

import com.sp.app.completeSell.CompleteSell;
import com.sp.app.completeSell.CompleteSellService;
import com.sp.app.materialSell.MaterialSell;
import com.sp.app.materialSell.MaterialSellService;
import com.sp.app.reservationSell.ReservationSell;
import com.sp.app.reservationSell.ReservationSellService;


@Controller
public class HomeController {
	@Autowired
	private MaterialSellService service1;
	@Autowired
	private CompleteSellService service2;
	@Autowired
	private ReservationSellService service3;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			HttpServletRequest req
			) {
		
		String cp=req.getContextPath();
		Map<String, Object> map = new HashMap<>();
			
	
		List<MaterialSell> list1=service1.listMaterialSell(map);
		List<CompleteSell> list2=service2.listCompleteSell(map);
		List<ReservationSell> list3=service3.listReservationSell(map);
		 
		String articleUrl1=cp+"/ms/article?page=1";
		String articleUrl2=cp+"/cp/article?page=1";
		String articleUrl3=cp+"/rv/article?page=1";
		
		model.addAttribute("articleUrl1",articleUrl1);
		model.addAttribute("articleUrl1",articleUrl2);
		model.addAttribute("articleUrl1",articleUrl3);
		
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		return ".main.main";
	}
}
