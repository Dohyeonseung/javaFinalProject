package com.sp.app.completeSell;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;



@Service("cp.completeSellService")
public class CompleteSellServiceImpl implements CompleteSellService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public List<CompleteSell> listCompleteSell(Map<String, Object> map) {
		List<CompleteSell> list = null;

		try {
			list = dao.selectList("cp.listCompleteSell", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("cp.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<CompleteSell> listCategory(Map<String, Object> map) {
		List<CompleteSell> listCategory = null;
		try {
			listCategory = dao.selectList("cp.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

	@Override
	public void insertCompleteSell(CompleteSell dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if (saveFilename != null) {
				dto.setImageFilename(saveFilename);

				dao.insertData("cp.insertCompleteSell", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCategory(CompleteSell dto) throws Exception {
		try {
			dao.insertData("cp.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public CompleteSell readCompleteSell(int productNum) {
		CompleteSell dto = null;

		try {
			dto = dao.selectOne("cp.readCompleteSell", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateCompleteSell(CompleteSell dto, String pathname) throws Exception {
		try {
			dao.updateData("cp.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCompleteSell(int productNum, String pathname, String userId) throws Exception {
		try {
			CompleteSell dto =readCompleteSell(productNum);
			if(dto==null || (! userId.equals("admin") && !dto.getUserId().equals(userId))) {
				return;
			}
			
			dao.deleteData("cp.deleteCompleteSell", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
 
	}
}
