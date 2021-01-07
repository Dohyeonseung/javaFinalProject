package com.sp.app.materialSell;

import java.util.List;
import java.util.Map;

public interface MaterialSellService {
	public void insertMaterialSell(MaterialSell dto, String pathname) throws Exception;
	public List<MaterialSell> listMaterialSell(Map<String, Object> map);
	public int mselldataCount(Map<String, Object> map);
	public MaterialSell readMaterialSell(int productNum);
	public void updateMaterialSell(MaterialSell dto, String pathname) throws Exception;
	public void deleteMaterialSell(int productNum,String pathname, String userId) throws Exception;

	public void insertCategory(MaterialSell dto) throws Exception;
	public void updateCategory(MaterialSell dto) throws Exception;
	public void deleteCategory(int categoryNum) throws Exception;
	public List<MaterialSell> listCategory(Map<String, Object> map);
}
