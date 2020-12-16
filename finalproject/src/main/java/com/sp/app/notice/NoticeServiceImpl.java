package com.sp.app.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("notice.seq");
			dto.setListNum(seq);

			dao.insertData("notice.insertNotice", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateHitCount(int listNum) throws Exception {
		try {
			dao.updateData("notice.updateHitCount", listNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Notice readNotice(int listNum) {
		Notice dto=null;

		try {
			dto=dao.selectOne("notice.readNotice", listNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto=null;

		try {
			dto=dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto=null;

		try {
			dto=dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		try {
			dao.updateData("notice.updateNotice", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(int listNum, String pathname) throws Exception {
		try {
			dao.deleteData("notice.deleteNotice", listNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	
}
