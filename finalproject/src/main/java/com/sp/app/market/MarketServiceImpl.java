package com.sp.app.market;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("market.marketService")
public class MarketServiceImpl implements MarketService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertProductOrder(Market dto) throws Exception {
		try {
			dao.insertData("market.insertProductOrder", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void insertProductReview(Market dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductReview(int reviewNum, int memberIdx, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHitCount(int salesNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("market.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int reviewDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Market> listSales(Map<String, Object> map) {
		List<Market> list = null;
		try {
			list = dao.selectList("market.listSales", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Market> listProductReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Market readSales(String productCode) {
		Market dto = null;
		try {
			dto = dao.selectOne("market.readSales", productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Market readOrder(String productCode, int buyCount) {
		Market dto = null;
		try {
			dto  = dao.selectOne("market.readSales", productCode);
			dto.setBuyCount(buyCount);
			dto.setTotalPrice(dto.getSalesPrice()*dto.getBuyCount());
			dto.setAmountPrice(dto.getTotalPrice()+dto.getCost());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateProductCount(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("market.productCountUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
