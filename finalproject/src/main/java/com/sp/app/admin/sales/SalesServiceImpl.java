package com.sp.app.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("sales.salesService")
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertProduct(Sales dto) throws Exception {
		try {
			dao.insertData("sales.insertProduct", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertSales(Sales dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(Sales dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSales(Sales dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("sales.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Sales> listProduct(Map<String, Object> map) {
		List<Sales> list = null;
		try {
			list = dao.selectList("sales.listProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sales> listSales(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sales readProduct(String productCode) {
		Sales dto = null;
		
		try {
			dto = dao.selectOne("sales.readProduct", productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Sales readSales(int salesNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(int salesNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertProductState(Sales dto) throws Exception {
		try {
			dao.updateData("sales.insertProductState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateProductState(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("sales.updateProductState", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Sales> listProductState(String productCode) {
		List<Sales> list = null;
		
		try {
			list = dao.selectList("sales.listProductState", productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Sales readProductState(String productCode) {
		Sales dto = null;
		try {
			dto = dao.selectOne("sales.readProductState", productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
