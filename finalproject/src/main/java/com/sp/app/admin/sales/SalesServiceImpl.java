package com.sp.app.admin.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("sales.salesService")
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertProduct(Sales dto, String pathname) throws Exception {
		try {
			String saveFileName = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFileName != null) {
				dto.setImageFileName(saveFileName);

				dao.insertData("sales.insertProduct", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteProduct(String productCode) throws Exception {
		try {
			dao.deleteData("sales.deleteProduct", productCode);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
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
	public void insertProductOrderCount(Sales dto) throws Exception {
		try {
			dao.insertData("sales.insertProductOrder", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateProductCount(Sales dto) throws Exception {
		try {
			dao.updateData("updateProductCount", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Sales> listProductOrder(String productCode) {
		List<Sales> list = null;
		try {
			list  = dao.selectList("sales.listProductOrder", productCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sales> orderList(Map<String, Object> map) {
		List<Sales> list = null;
		try {
			list = dao.selectList("sales.salesOrderList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataOrderCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("sales.dataOrderCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Sales readOrderInfo(int orderNum) {
		Sales dto = null;
		try {
			dto = dao.selectOne("sales.readOrderInfo", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertOrderProcessing(Sales dto) throws Exception {
		try {
			dao.insertData("sales.insertOrderProcessing", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Sales> orderProcessingList(int orderNum) {
		List<Sales> list = null;
		try {
			list = dao.selectList("sales.orderProcessingList", orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrderProcessing(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("sales.updateOrderProcessing", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


}
