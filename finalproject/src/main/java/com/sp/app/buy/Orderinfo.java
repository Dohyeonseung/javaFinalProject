package com.sp.app.buy;

import java.util.List;

public class Orderinfo {
	private int orderId;
	private long memberIdx;
	private int total_price;
	private int order_state;
	private String order_date;
	private String Addr1;
	private String Addr2;
	private int reserves;
	
	private String tel, tel1, tel2, tel3;
	private String othertel, othertel1, othertel2, othertel3;
	
	private int orderId_detail;
	private int count;
	private String productName;
	private int price;
	private int productNum;
	private String zip;
	private String customer;
	private String content;
	private String userName;
	
	private int cId;
	
	private List<Integer> productNums;
	private List<String> productNames;
	private List<Integer> counts;
	private List<Integer> prices;
	private List<Integer> cIds;
	private String imageFilename;
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getAddr1() {
		return Addr1;
	}
	public void setAddr1(String addr1) {
		Addr1 = addr1;
	}
	public String getAddr2() {
		return Addr2;
	}
	public void setAddr2(String addr2) {
		Addr2 = addr2;
	}
	public int getReserves() {
		return reserves;
	}
	public void setReserves(int reserves) {
		this.reserves = reserves;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getOthertel() {
		return othertel;
	}
	public void setOthertel(String othertel) {
		this.othertel = othertel;
	}
	public String getOthertel1() {
		return othertel1;
	}
	public void setOthertel1(String othertel1) {
		this.othertel1 = othertel1;
	}
	public String getOthertel2() {
		return othertel2;
	}
	public void setOthertel2(String othertel2) {
		this.othertel2 = othertel2;
	}
	public String getOthertel3() {
		return othertel3;
	}
	public void setOthertel3(String othertel3) {
		this.othertel3 = othertel3;
	}
	public int getOrderId_detail() {
		return orderId_detail;
	}
	public void setOrderId_detail(int orderId_detail) {
		this.orderId_detail = orderId_detail;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public List<Integer> getProductNums() {
		return productNums;
	}
	public void setProductNums(List<Integer> productNums) {
		this.productNums = productNums;
	}
	public List<String> getProductNames() {
		return productNames;
	}
	public void setProductNames(List<String> productNames) {
		this.productNames = productNames;
	}
	public List<Integer> getCounts() {
		return counts;
	}
	public void setCounts(List<Integer> counts) {
		this.counts = counts;
	}
	public List<Integer> getPrices() {
		return prices;
	}
	public void setPrices(List<Integer> prices) {
		this.prices = prices;
	}
	public List<Integer> getcIds() {
		return cIds;
	}
	public void setcIds(List<Integer> cIds) {
		this.cIds = cIds;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
}
