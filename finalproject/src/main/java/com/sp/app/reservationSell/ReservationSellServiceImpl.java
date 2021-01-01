package com.sp.app.reservationSell;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;



@Service("rv.reservationSellService")
public class ReservationSellServiceImpl implements ReservationSellService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public void insertReservationSell(ReservationSell dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);
				
			dao.insertData("rv.insertReservationSell", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public List<ReservationSell> listReservationSell(Map<String, Object> map) {
		List<ReservationSell> list=null;
		try {
			list=dao.selectList("rv.listReservationSell",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		
		try {
			result=dao.selectOne("rv.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public ReservationSell readReservationSell(int productNum) {
		ReservationSell dto =null;
		
		try {
			dto=dao.selectOne("rv.readReservationSell",productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateReservationSell(ReservationSell dto, String pathname) throws Exception {
		
		try {
		String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
		if (saveFilename != null) {
			// 이전 파일 지우기
			if(dto.getImageFilename().length()!=0) {
				fileManager.doFileDelete(dto.getImageFilename(), pathname);
			}
			dto.setImageFilename(saveFilename);
		}
		
			dao.updateData("rv.updateReservationSell", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void deleteReservationSell(int productNum,String pathname, String userId) throws Exception {
		try {
			ReservationSell dto =readReservationSell(productNum);
			if(dto==null || (! userId.equals("admin") && !dto.getUserId().equals(userId))) {
				return;
			}
			
			dao.deleteData("rv.deleteReservationSell", productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

	public List<ReservationSell> listCategory(Map<String, Object> map) {
		List<ReservationSell> listCategory = null;
		try {
			listCategory = dao.selectList("rv.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}
	
	
}
