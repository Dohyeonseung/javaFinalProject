package com.sp.app.completeSell;

import org.springframework.web.multipart.MultipartFile;

public class CompleteSell {
	private int productNum, listNum;
	private String productName;
	private String userId;
	private String price;
	private String stock;
	private String reserves;
	private String content;
	private String created_date;
	private String imageFilename;
	private int division;
	
	private int categoryNum;
	private String categoryName;

	private MultipartFile upload;
	

	public int getProductNum() {
		return productNum;
	}



	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}



	public int getListNum() {
		return listNum;
	}



	public void setListNum(int listNum) {
		this.listNum = listNum;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getStock() {
		return stock;
	}



	public void setStock(String stock) {
		this.stock = stock;
	}



	public String getReserves() {
		return reserves;
	}



	public void setReserves(String reserves) {
		this.reserves = reserves;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getCreated_date() {
		return created_date;
	}



	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}



	public String getImageFilename() {
		return imageFilename;
	}



	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}



	public int getDivision() {
		return division;
	}



	public void setDivision(int division) {
		this.division = division;
	}



	public int getCategoryNum() {
		return categoryNum;
	}



	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public MultipartFile getUpload() {
		return upload;
	}



	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}



	
	
	
}
