package com.sp.app.admin.authority;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.consumer.SellerInfo;

@Service("authority.authorityService")
public class AuthorityServiceImpl implements AuthorityService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<SellerInfo> sellerList(Map<String, Object> map) throws Exception {
		List<SellerInfo> list = null;
		
		try {
			list = dao.selectList("sellerList", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void sellerChange(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("sellerChange", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int sellerListCount(int num) throws Exception {
		int result = 0;
		try {
			if(num != 0) {
				result = dao.selectOne("sellerListCountAll");
			}
			
			if(num == 0) {
				result = dao.selectOne("sellerListCount", num);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return result;
	}
}
