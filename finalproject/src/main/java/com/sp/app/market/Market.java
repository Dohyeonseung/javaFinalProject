package com.sp.app.market;

import org.springframework.web.multipart.MultipartFile;

public class Market {
	
	// 파일
	private MultipartFile upload;
	
	// 리스트
	private int num;
	private int listNum;
	
	// 테이블관계
	private long memberIdx;
	private int categoryNum;
	private int salesNum;
	private int reviewNum;
	private int orderNum; // 주문번호
	private String productCode; // 상품코드
	private String userId;
	
	// 카테고리 테이블
	private String categoryName;				
		
	// 상품테이블
	private String productName; // 상품명
	private String productInfo; // 상품정보
	private String registrationDate; // 상품등록일
	private String imageFileName;
	private int productPrice; // 상품가격
	private int salesPrice; // 판매금액
	private int productCount; // 상품개수
	private int statement; // 상품상태
	
	// 주문테이블
	private String orderer; // 주문자
	private int orderState; // 주문상태
	private int zip; // 우편번호
	private String orderAddress; //주소
	private String addr1;
	private String addr2;
	private String orderTel; //주문자 연락처
	private String tel1;
	private String tel2;
	private String tel3;
	private String orderTel2; // 예비번호
	private String sTel1;
	private String sTel2;
	private String sTel3;
	private String orderDate; // 주문날짜
	private String reqMessage; // 요청사항
	private int amountPrice; // 결제금액
	
	
	// 리뷰테이블
	private String r_subject;
	private String r_content;
	private String reviewDate;
	private int starCount;

	// 계산
	private int cost;
	private int buyCount;
	private int totalPrice;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
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
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public int getSalesNum() {
		return salesNum;
	}
	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public int getStatement() {
		return statement;
	}
	public void setStatement(int statement) {
		this.statement = statement;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getOrderTel() {
		return orderTel;
	}
	public void setOrderTel(String orderTel) {
		this.orderTel = orderTel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getOrderTel2() {
		return orderTel2;
	}
	public void setOrderTel2(String orderTel2) {
		this.orderTel2 = orderTel2;
	}
	public String getsTel1() {
		return sTel1;
	}
	public void setsTel1(String sTel1) {
		this.sTel1 = sTel1;
	}
	public String getsTel2() {
		return sTel2;
	}
	public void setsTel2(String sTel2) {
		this.sTel2 = sTel2;
	}
	public String getsTel3() {
		return sTel3;
	}
	public void setsTel3(String sTel3) {
		this.sTel3 = sTel3;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getAmountPrice() {
		return amountPrice;
	}
	public void setAmountPrice(int amountPrice) {
		this.amountPrice = amountPrice;
	}
	public String getR_subject() {
		return r_subject;
	}
	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getStarCount() {
		return starCount;
	}
	public void setStarCount(int starCount) {
		this.starCount = starCount;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getReqMessage() {
		return reqMessage;
	}
	public void setReqMessage(String reqMessage) {
		this.reqMessage = reqMessage;
	}
	public int getCost() {
		cost = 2500;
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}

}
