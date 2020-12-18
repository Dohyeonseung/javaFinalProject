package com.sp.app.buy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("buy.buyService")
public class BuyServiceImpl implements BuyService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list=null;
		try {
			list=dao.selectList("buy.listProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("buy.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Product readProduct(int productNum) {
		Product dto=null;
		try {
			dto=dao.selectOne("buy.readProduct", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Product preReadProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product nextReadProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
