package com.sp.app.buy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("buy.buyService")
public class BuyServiceImpl implements BuyService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list=null;
		try {
			list=dao.selectList("buy.listProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("buy.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Product readProduct(int productNum) {
		Product dto=null;
		try {
			dto=dao.selectOne("buy.readProduct", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertOrderinfo(Orderinfo dto) throws Exception {
		try {
			if(dto.getProductNums()==null || dto.getProductNums().size()==0) {
				return;
			}
			
			// 오더번호 설정
			int seq=dao.selectOne("buy.seq");
			dto.setOrderId(seq);
			// 오더 저장
			dao.insertData("buy.insertOrderinfo", dto);
			
			// 상세저장
			for(int i=0; i<dto.getProductNums().size(); i++) {
				dto.setProductNum(dto.getProductNums().get(i));
				dto.setProductName(dto.getProductNames().get(i));
				dto.setCount(dto.getCounts().get(i));
				dto.setPrice(dto.getPrices().get(i));
				
				dao.insertData("buy.insertOrder_detail", dto);
			}
			
			// 배송정보 저장
			if(dto.getTel1().length()!=0 && dto.getTel2().length()!=0 && dto.getTel3().length()!=0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			if(dto.getOthertel1().length()!=0 && dto.getOthertel2().length()!=0 && dto.getOthertel3().length()!=0) {
				dto.setTel(dto.getOthertel1() + "-" + dto.getOthertel2() + "-" + dto.getOthertel3());
			}
			
			dao.insertData("buy.insertdelivery", dto);
			
			if(dto.getcIds()!=null) {
				// for(Integer cId : dto.getcIds()) {
					// cart에서 cId인 데이터 삭제
					
				// }
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCart(Cart dto) throws Exception {
		try {
			dao.insertData("buy.insertCart", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Cart> listCart(Map<String, Object> map) {
		List<Cart> list=null;
		try {
			list=dao.selectList("buy.listCart", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCart(int cId) throws Exception {
		try {
			dao.deleteData("buy.deleteCart", cId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCart(List<String> cIds) throws Exception {
		try {
			dao.deleteData("buy.deleteCartlist", cIds);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Cart> listCart(List<String> list) {
		List<Cart> cartList=null;
		try {
			cartList=dao.selectList("buy.listCartBuy", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cartList;
	}



	

}
