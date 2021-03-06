package com.sp.app.admin.sales;

import java.util.List;
import java.util.Map;

public interface SalesService {
	
	public void insertProduct(Sales dto, String pathname) throws Exception; // 상품등록
	public void insertProductState(Sales dto) throws Exception; // 상태등록
	public void insertProductOrderCount(Sales dto) throws Exception; // 발주
	public void insertOrderProcessing(Sales dto) throws Exception; // 주문처리
	
	public void deleteProduct(String productCode) throws Exception; // 상품삭제
	
	public int dataCount(Map<String, Object> map); // 데이터갯수
	public int dataOrderCount(Map<String, Object> map);
	public List<Sales> listProduct(Map<String, Object> map); // 상품리스트
	public List<Sales> orderList(Map<String, Object> map); // 주문리스트
	public List<Sales> listProductState(String productCode); // 상품상태리스트
	public List<Sales> listProductOrder(String productCode); // 발주리스트
	public List<Sales> orderProcessingList(int orderNum); // 주문처리상태리스트
	
	public Sales readProduct(String productCode); // 상품 상세정보
	public Sales readOrderInfo(int orderNum);
	
	public void updateProductState(Map<String, Object> map) throws Exception; // 상태업데이트
	public void updateProductCount(Sales dto) throws Exception; // 수량 갱신
	public void updateOrderProcessing(Map<String, Object> map) throws Exception;
}
