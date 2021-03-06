package com.sp.app.materialSell;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;



@Service("ms.materialSellService")
public class MaterialSellServiceImpl implements MaterialSellService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public void insertMaterialSell(MaterialSell dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);
				
			dao.insertData("ms.insertMaterialSell", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public List<MaterialSell> listMaterialSell(Map<String, Object> map) {
		List<MaterialSell> list=null;
		try {
			list=dao.selectList("ms.listMaterialSell",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int mselldataCount(Map<String, Object> map) {
		int result =0;
		
		try {
			result=dao.selectOne("ms.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public MaterialSell readMaterialSell(int productNum) {
		MaterialSell dto =null;
		
		try {
			dto=dao.selectOne("ms.readMaterialSell",productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateMaterialSell(MaterialSell dto, String pathname) throws Exception {
		
		try {
		String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
		if (saveFilename != null) {
			// 이전 파일 지우기
			if(dto.getImageFilename().length()!=0) {
				fileManager.doFileDelete(dto.getImageFilename(), pathname);
			}
			dto.setImageFilename(saveFilename);
		}
		
			dao.updateData("ms.updateMaterialSell", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void deleteMaterialSell(int productNum,String pathname, String userId) throws Exception {
		try {
			MaterialSell dto =readMaterialSell(productNum);
			if(dto==null || (! userId.equals("admin") && !dto.getUserId().equals(userId))) {
				return;
			}
			
			dao.deleteData("ms.deleteMaterialSell", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void insertCategory(MaterialSell dto) throws Exception {
		try {
			dao.insertData("ms.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void updateCategory(MaterialSell dto) throws Exception {
		try {
			dao.updateData("ms.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		try {
			dao.deleteData("ms.deleteCategory", categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public List<MaterialSell> listCategory(Map<String, Object> map) {
		List<MaterialSell> listCategory = null;
		try {
			listCategory = dao.selectList("ms.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}
	
	
}
