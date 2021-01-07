package com.sp.app.buy;

import java.util.List;
import java.util.Map;

public interface BuyService {
	public List<Product> listProduct_mat(Map<String, Object> map); // 상품 리스트(재료용)
	public List<Product> listProduct_rsv(Map<String, Object> map); // 상품 리스트(예약용)
	public List<Product> listProduct_complete(Map<String, Object> map); // 상품 리스트(완제용)
	
	public int dataCount_mat(Map<String, Object> map); // 페이징 처리(재료용)
	public int dataCount_rsv(Map<String, Object> map); // 페이징 처리(예약용)
	public int dataCount_complete(Map<String, Object> map); // 페이징 처리(완제용)
	
	public Product readProduct(int productNum); // 상품 상세페이지 들어가기

	public void insertOrderinfo(Orderinfo dto) throws Exception; // 주문하기
	public List<Orderinfo> listOrder(Map<String, Object> map); // 주문 기록 조회
	public List<Orderinfo> listOrder_detail(Map<String, Object> map); // 주문 상 조회

	public void insertCart(Cart dto) throws Exception; // 장바구니 넣기
	public List<Cart> listCart(Map<String, Object> map); // 장바구니 리스트
	public void deleteCart(int cId) throws Exception; // 장바구니 목록 하나 삭제
	
	public void deleteCart(List<String> cIds) throws Exception; // 장바구니 목록 여러 개 삭제
	public List<Cart> listCart(List<String> list); // 주문에 장바구니 목록 여러 개 띄우기
	
}
