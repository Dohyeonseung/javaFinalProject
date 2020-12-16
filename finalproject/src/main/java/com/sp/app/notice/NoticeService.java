package com.sp.app.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public void insertNotice(Notice dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	
	public void updateHitCount(int listNum) throws Exception;
	public Notice readNotice(int listNum);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	
	public void updateNotice(Notice dto, String pathname) throws Exception;
	public void deleteNotice(int listNum, String pathname) throws Exception;
	
}
