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
	public int dataCount(Map<String, Object> map) {
		int result =0;
		
		try {
			result=dao.selectOne("ms.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public MaterialSell readMaterialSell(int productNum) {
		MaterialSell dto =null;
		
		try {
			dto=dao.selectOne("ms.readMaterialSell");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	@Override
	public MaterialSell preReadMaterialSell(Map<String, Object> map) {
		MaterialSell dto =null;
		try {
			dto=dao.selectOne("ms.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public MaterialSell nextReadMaterialSell(Map<String, Object> map) {
		MaterialSell dto=null;
		try {
			dto=dao.selectOne("ms.nextReadMaterialSell",map);
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
			
			dao.deleteData("ms.deleteBoard", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
