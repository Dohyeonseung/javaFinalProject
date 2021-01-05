package com.sp.app.region;

import org.springframework.web.multipart.MultipartFile;

public class Region {
    private int num, listNum;
    private String userName, userId;
    private String subject, content;
    private String created;
    private String saveFilename;
	private int region;
    public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public int getRegion() {
		return region;
	}
	public void setRegion(int region) {
		this.region = region;
	}
	private String category;
    private int hitCount;
    private MultipartFile upload;
    
    private int replyCount;
	private int regionLikeCount;
    
    public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getRegionLikeCount() {
		return regionLikeCount;
	}
	public void setRegionLikeCount(int regionLikeCount) {
		this.regionLikeCount = regionLikeCount;
	}
	
	
}
