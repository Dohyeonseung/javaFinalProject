package com.sp.app.admin.sales;

import org.springframework.web.multipart.MultipartFile;

public class Sales {
	
	// 파일
	private MultipartFile upload;
	
	// 리스트
	private int num;
	private int listNum;
	
	// 테이블관계
	private long memberIdx;
	private int orderNum;
	private int categoryNum;
	private int detailOrderNum;
	private String productCode; // 상품코드
	private String userId;
	
	// 카테고리 테이블
	private String categoryName;
	
	// 상품상태 테이블
	private int stateCode;
	private int stateNum; // 상태번호
	private String stateDate; // 상태변경일
	private String stateMemo; // 변경사유
	
	// 발주테이블
	private int productOrderNum; // 발주번호
	private String productOrderMemo; // 발주사유
	private String productOrderDate; // 발주날자
	private int  productOrderCount; // 상품 발주 갯수 = 현재 상품 보유갯수
	
	// 상품테이블
	private String productName; // 상품명
	private String productInfo; // 상품정보
	private String registrationDate; // 상품등록일
	private String imageFileName; // 이미지 파일 이름
	private int productPrice; // 상품가격
	private int salesPrice; // 판매가격
	private int productCount; // 상품개수
	private int statement; // 상품상태
	
	// 상세주문정보
	private String order_productName; // 주문상품이름
	private int detailPrice; // 각 상품 가격
	private int count; // 주문수량
	
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
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public int getDetailOrderNum() {
		return detailOrderNum;
	}
	public void setDetailOrderNum(int detailOrderNum) {
		this.detailOrderNum = detailOrderNum;
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
	public int getStateCode() {
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public int getStateNum() {
		return stateNum;
	}
	public void setStateNum(int stateNum) {
		this.stateNum = stateNum;
	}
	public String getStateDate() {
		return stateDate;
	}
	public void setStateDate(String stateDate) {
		this.stateDate = stateDate;
	}
	public String getStateMemo() {
		return stateMemo;
	}
	public void setStateMemo(String stateMemo) {
		this.stateMemo = stateMemo;
	}
	public int getProductOrderNum() {
		return productOrderNum;
	}
	public void setProductOrderNum(int productOrderNum) {
		this.productOrderNum = productOrderNum;
	}
	public String getProductOrderMemo() {
		return productOrderMemo;
	}
	public void setProductOrderMemo(String productOrderMemo) {
		this.productOrderMemo = productOrderMemo;
	}
	public String getProductOrderDate() {
		return productOrderDate;
	}
	public void setProductOrderDate(String productOrderDate) {
		this.productOrderDate = productOrderDate;
	}
	public int getProductOrderCount() {
		return productOrderCount;
	}
	public void setProductOrderCount(int productOrderCount) {
		this.productOrderCount = productOrderCount;
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
	public String getOrder_productName() {
		return order_productName;
	}
	public void setOrder_productName(String order_productName) {
		this.order_productName = order_productName;
	}
	public int getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(int detailPrice) {
		this.detailPrice = detailPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getReqMessage() {
		return reqMessage;
	}
	public void setReqMessage(String reqMessage) {
		this.reqMessage = reqMessage;
	}
	public int getAmountPrice() {
		return amountPrice;
	}
	public void setAmountPrice(int amountPrice) {
		this.amountPrice = amountPrice;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
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
	
	
}
