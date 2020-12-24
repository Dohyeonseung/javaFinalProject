package com.sp.app.consumer;

import java.util.List;
import java.util.Map;

public interface ConsumerService {
//	질문 등록
	public void insertQna(ConsumerQNA dto, String pathname) throws Exception;

//	답변 등록
	public void insertAnswer(ConsumerQNA dto, String pathname) throws Exception;

//	파일 등록
	public void insertFile(ConsumerQNA dto) throws Exception;
	
//	리스트 갯수
	public int dataCount(Map<String, Object> map);
	
//	자주하는 질문 BEST10 리스트 출력 
	public List<ConsumerFAQ> populList(Map<String, Object> map);
	
//	자주하는 질문 리스트 출력
	public List<ConsumerFAQ> fqaList(Map<String, Object> map);
	
//	 자주하는 질문 조회수 증가
	public void updateReview(int num) throws Exception;
	
//	자주하는 질문 등록
	public void insertFAQ(ConsumerFAQ dto) throws Exception;
}
