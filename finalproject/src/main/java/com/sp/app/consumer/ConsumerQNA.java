package com.sp.app.consumer;

public class ConsumerQNA {
	// 질문
	private int qnaNum;
	private String userId;
	private String userName;
	private String q_subject;
	private String q_content;
	private String q_created;
	
	// 답변
	private String a_subject;
	private String a_content;
	private String a_created;
	
	// 파일
	private String fileNum;
	private String saveFileName;
	private String originalFileName;
	
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_created() {
		return q_created;
	}
	public void setQ_created(String q_created) {
		this.q_created = q_created;
	}
	public String getA_subject() {
		return a_subject;
	}
	public void setA_subject(String a_subject) {
		this.a_subject = a_subject;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_created() {
		return a_created;
	}
	public void setA_created(String a_created) {
		this.a_created = a_created;
	}
	public String getFileNum() {
		return fileNum;
	}
	public void setFileNum(String fileNum) {
		this.fileNum = fileNum;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	
	
}
