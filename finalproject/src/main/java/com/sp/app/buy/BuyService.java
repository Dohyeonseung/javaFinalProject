package com.sp.app.buy;

import java.util.List;
import java.util.Map;

public interface BuyService {
	public List<Product> listProduct(Map<String, Object> map); // 상품 리스트
	public int dataCount(Map<String, Object> map); // 페이징 처리
	public Product readProduct(int productNum); // 게시글 들어가기
	public Product preReadProduct(Map<String, Object> map); // 이전 게시글
	public Product nextReadProduct(Map<String, Object> map); // 다음 게시글
}
