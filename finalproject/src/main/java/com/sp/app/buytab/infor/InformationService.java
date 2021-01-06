package com.sp.app.buytab.infor;

import java.util.List;
import java.util.Map;




public interface InformationService {
	
	public void insertReview(Review dto) throws Exception;
	public int dataCountReview(Map<String, Object> map);
	public List<Review> listReview(Map<String, Object> map);
	
	
	public List<Qna> listQna(Map<String, Object> map);
	public int QnaCount(Map<String, Object> map);
	
	public void questionsQna(Qna dto) throws Exception;
}
