package com.sp.app.region;

import java.util.List;
import java.util.Map;

public interface RegionService {
	public void insertregion(Region dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Region> listregion(Map<String, Object> map);
	public Region readregion(int num);
	public void updateregion(Region dto, String pathname) throws Exception;
	public void deleteregion(int num, String pathname, String userId) throws Exception;
	
	public void insertregionLike(Map<String, Object> map) throws Exception;
	public int regionLikeCount(int num);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);

}


