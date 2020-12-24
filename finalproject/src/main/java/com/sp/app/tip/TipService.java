package com.sp.app.tip;

import java.util.List;
import java.util.Map;

public interface TipService {
	public void insertTip(Tip dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Tip> listTip(Map<String, Object> map);
	public Tip readTip(int num);
	public Tip preReadTip(Map<String, Object> map);
	public Tip nextReadTip(Map<String, Object> map);
	public void updateTip(Tip dto, String pathname) throws Exception;
	public void deleteTip(int num, String pathname, String userId) throws Exception;
}


