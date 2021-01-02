package com.sp.app.tip;

import java.util.List;
import java.util.Map;

public interface TipService {
	public void insertTip(Tip dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Tip> listTip(Map<String, Object> map);
	public Tip readTip(int num);
	public void updateTip(Tip dto, String pathname) throws Exception;
	public void deleteTip(int num, String pathname, String userId) throws Exception;
	
	public void insertCategory(Tip dto) throws Exception;
	public List<Tip> listCategory(Map<String, Object> map);
	public void deleteCategory(int categoryNum) throws Exception;
	
	public void insertTipLike(Map<String, Object> map) throws Exception;
	public int tipLikeCount(int num);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}


