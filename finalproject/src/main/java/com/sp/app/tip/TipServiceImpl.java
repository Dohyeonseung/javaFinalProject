package com.sp.app.tip;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("faq.faqService")
public class TipServiceImpl implements TipService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertFaq(Tip dto) throws Exception {
		try {
			dao.insertData("faq.insertFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Tip> listFaq(Map<String, Object> map) {
		List<Tip> list = null;
		
		try {
			list=dao.selectList("faq.listFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("faq.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Tip readFaq(int num) {
		Tip dto = null;
		try {
			dto = dao.selectOne("faq.readFaq", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateFaq(Tip dto) throws Exception {
		try {
			dao.updateData("faq.updateFaq", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("faq.deleteFaq", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertCategory(Tip dto) throws Exception {
		try {
			dao.insertData("faq.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateCategory(Tip dto) throws Exception {
		try {
			dao.updateData("faq.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Tip> listCategory(Map<String, Object> map) {
		List<Tip> listCategory = null;
		try {
			listCategory = dao.selectList("faq.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		try {
			dao.deleteData("faq.deleteCategory", categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertTipLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int TipLikeCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyAnswerCount(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
