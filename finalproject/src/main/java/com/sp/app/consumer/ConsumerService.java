package com.sp.app.consumer;

public interface ConsumerService {
	// 질문 등록
	public void insertQna(ConsumerQNA dto, String pathname) throws Exception;
	// 답변 등록
	public void insertAnswer(ConsumerQNA dto, String pathname) throws Exception; 
}
