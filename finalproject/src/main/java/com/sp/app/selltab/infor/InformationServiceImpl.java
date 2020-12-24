package com.sp.app.selltab.infor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sp.app.common.dao.CommonDAO;

@Service("selltab.informationService")
public class InformationServiceImpl implements InformationService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("infor.dataCountInformation", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Information> listInformation(Map<String, Object> map) {
		List<Information> list =null;
		
		try {
			list=dao.selectList("infor.listInformation", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public int dataCountReview(Map<String, Object> map) {
		int result =0;
		
		try {
			result=dao.selectOne("infor.dataCountReview");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list =null;
		
		try {
			list=dao.selectList("infor.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list=null;
		try {
			list=dao.selectList("infor.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int QnaCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("infor.dataCountQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertQna(Qna dto) throws Exception {
		try {
			dao.insertData("infor.insertQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int replyQnaCount(int answer) {
		int result=0;
		try {
			result=dao.selectOne("infor.replyQnaCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("infor.deleteQna", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	

}
