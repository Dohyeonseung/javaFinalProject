package com.sp.app.consumer;

import java.util.List;
import java.util.Map;

public interface ConsumerService {
//	질문 등록
	public void insertQna(ConsumerQNA dto) throws Exception;

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
	
//	자주하는 질문 조회수 증가
	public void updateReview(int num) throws Exception;
	
//	자주하는 질문 등록
	public void insertFAQ(ConsumerFAQ dto) throws Exception;
	
//	내문의내역 리스트 조회
	public List<ConsumerQNA> listQNA(Map<String, Object> map) throws Exception;
	
//	내문의내역 읽기
	public ConsumerQNA readQNA(int num) throws Exception;
	
//	리뷰 별점 저장
	public void answerReviewSubmit(Map<String, Object> map) throws Exception;
	
//	메인에서 자주하는 질문 클릭
	public ConsumerFAQ populRead(int num) throws Exception;
	
//	어드민 리스트 페이지 load
	public List<ConsumerQNA> listAdminLoad(Map<String, Object> map) throws Exception;
	
//	어드민 리스트 갯수
	public int adminQNACount(int questionType) throws Exception;
	
//	판매자 등록 기본정보 load
	public SellerInfo infoLoad(String userId) throws Exception;
	
//	판매자 기초 기본정보 등록
	public void sellerFirst(SellerInfo dto) throws Exception;

//	내문의내역 dataCount
	public int myHistoryDataCount(String userId) throws Exception;
	
//	답변등록
	public void qnaAnswer(Map<String, Object> map) throws Exception;
}
