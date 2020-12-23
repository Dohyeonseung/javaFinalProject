package com.sp.app.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("qna.qnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertQna(Qna dto, String mode) throws Exception {
try {
			
			int seq=dao.selectOne("qna.seq");
			
			if(mode.equals("created")) {
				dto.setBoardNum(seq);
				dto.setGroupNum(seq);
				dto.setDepth(0);
				dto.setOrderNo(0);
				dto.setParent(0);
			} else {
				Map<String, Object> map = new HashMap<>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				dao.updateData("qna.updateOrderNo", map);
				
				dto.setBoardNum(seq);
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			
			dao.insertData("qna.insertQna", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		
		try {
			list=dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Qna readQna(int boardNum) {
		Qna dto=null;
		try {
			dto=dao.selectOne("qna.readQna", boardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateQna(Qna dto) throws Exception {
		try {
			dao.updateData("qna.updateQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteQna(int boardNum, String userId) throws Exception {
		try {
			Qna dto=readQna(boardNum);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return;
			
			dao.deleteData("qna.deleteQna", boardNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Qna> listArticleQna(int groupNum) {
		List<Qna> list=null;
		
		try {
			list=dao.selectList("qna.listArticleQna", groupNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
