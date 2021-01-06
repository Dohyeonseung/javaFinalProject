package com.sp.app.buytab.infor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("buytab.informationService")
public class InformationServiceImpl implements InformationService {
	
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int dataCountReview(Map<String, Object> map) {
		int result =0;
		
		try {
			result=dao.selectOne("buytab.dataCountReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list =null;
		
		try {
			list=dao.selectList("buytab.listReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list=null;
		try {
			list=dao.selectList("buytab.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int QnaCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("buytab.dataCountQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReview(Review dto) throws Exception {
		try {
			dao.insertData("buytab.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void questionsQna(Qna dto) throws Exception {
		try {
			dao.insertData("buytab.questionsQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
}
