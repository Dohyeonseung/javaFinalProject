package com.sp.app.materialSell;

import java.util.List;
import java.util.Map;

public interface MaterialSellService {
	public void insertMaterialSell(MaterialSell dto, String pathname) throws Exception;
	public List<MaterialSell> listMaterialSell(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public MaterialSell readMaterialSell(int productNum);
	public MaterialSell preReadMaterialSell(Map<String, Object>map);
	public MaterialSell nextReadMaterialSell(Map<String, Object> map);
	public void updateMaterialSell(MaterialSell dto, String pathname) throws Exception;
	public void deleteMaterialSell(int productNum,String pathname, String userId) throws Exception;
}
