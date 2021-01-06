package com.sp.app.admin.authority;

import java.util.List;
import java.util.Map;

import com.sp.app.consumer.SellerInfo;

public interface AuthorityService {
	
//	판매자 신청 리스트
	public List<SellerInfo> sellerList(Map<String, Object> map) throws Exception;
	
//	판매자 권한 변경
	public void sellerChange(Map<String, Object> map) throws Exception;
	
//	판매자 신청 인원수
	public int sellerListCount(int num) throws Exception;
}
