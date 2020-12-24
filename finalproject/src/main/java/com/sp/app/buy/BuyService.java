package com.sp.app.buy;

import java.util.List;
import java.util.Map;

public interface BuyService {
	public List<Product> listProduct(Map<String, Object> map); // 상품 리스트
	public int dataCount(Map<String, Object> map); // 페이징 처리
	public Product readProduct(int productNum); // 상품 상세페이지 들어가기
	public void insertOrderinfo(Orderinfo dto) throws Exception; // 주문하기
	public void insertCart(Cart dto) throws Exception; // 장바구니 넣기
	public List<Cart> listCart(Map<String, Object> map); // 장바구니 리스트
}
