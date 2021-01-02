package com.sp.app.completeSell;

import java.util.List;
import java.util.Map;

public interface CompleteSellService {
	public void insertCompleteSell(CompleteSell dto, String pathname) throws Exception;
	public List<CompleteSell> listCompleteSell(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public CompleteSell readCompleteSell(int productNum);
	public void updateCompleteSell(CompleteSell dto, String pathname) throws Exception;
	public void deleteCompleteSell(int productNum,String pathname, String userId) throws Exception;
	
	
	public List<CompleteSell> listCategory(Map<String, Object> map);
	public void insertCategory(CompleteSell dto) throws Exception;
	
}
