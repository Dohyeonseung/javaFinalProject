package com.sp.app.tip;

import java.util.List;
import java.util.Map;

public interface TipService {
	public void insertFaq(Tip dto) throws Exception;
	public List<Tip> listFaq(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Tip readFaq(int num);
	public void updateHitCount(int num) throws Exception;
	public void updateFaq(Tip dto) throws Exception;
	public void deleteFaq(Map<String, Object> map) throws Exception;
	
	public void insertTipLike(Map<String, Object> map) throws Exception;
	public int TipLikeCount(int num);
	
	public void insertCategory(Tip dto) throws Exception;
	public void updateCategory(Tip dto) throws Exception;
	public List<Tip> listCategory(Map<String, Object> map);
	public void deleteCategory(int categoryNum) throws Exception;

	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}


