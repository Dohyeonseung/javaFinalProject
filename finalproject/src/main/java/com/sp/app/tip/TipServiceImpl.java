package com.sp.app.tip;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("tip.tipService")
public class TipServiceImpl implements TipService {
	
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertTip(Tip dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setSaveFilename(saveFilename);

				dao.insertData("tip.insertTip", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Tip> listTip(Map<String, Object> map) {
		List<Tip> list = null;
		
		try {
			list=dao.selectList("tip.listTip", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Tip readTip(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Tip preReadTip(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Tip nextReadTip(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateTip(Tip dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTip(int num, String pathname, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
