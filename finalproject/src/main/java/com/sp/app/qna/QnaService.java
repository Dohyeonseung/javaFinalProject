package com.sp.app.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto, String mode) throws Exception;
	public List<Qna> listQna(Map<String, Object> map);
	
	public int dataCount(Map<String, Object> map);
	public Qna readQna(int boardNum);
	
	public void updateQna(Qna dto) throws Exception;
	public void deleteQna(int boardNum, String userId) throws Exception;
	
	public List<Qna> listArticleQna(int groupNum);
}
