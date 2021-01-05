package com.sp.app.market;

import java.util.List;
import java.util.Map;

public interface MarketService {
	public void insertProductReview(Market dto) throws Exception;
	
	public void deleteProductReview(int reviewNum, int memberIdx, String pathname) throws Exception;
	
	public void updateHitCount(int salesNum) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public int reviewDataCount(Map<String, Object> map);
	
	public List<Market> listSales(Map<String, Object> map);
	public List<Market> listProductReview(Map<String, Object> map);
	
	public Market readSales(String productCode);
	
	
}
