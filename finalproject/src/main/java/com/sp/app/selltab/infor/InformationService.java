package com.sp.app.selltab.infor;

import java.util.List;
import java.util.Map;

public interface InformationService {
	public int dataCount(Map<String, Object> map);
	public List<Information> listInformation(Map<String, Object> map);
	
	public int dataCountReview(Map<String, Object> map);
	public List<Review> listReview(Map<String, Object> map);
	
	public List<Qna> listQna(Map<String, Object> map);
	public int QnaCount(Map<String, Object> map);
	public void answerQna(Qna dto) throws Exception;

}
