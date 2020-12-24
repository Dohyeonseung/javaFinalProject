package com.sp.app.consumer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("consumer.consumerService")
public class ConsumerServiceImpl implements ConsumerService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertQna(ConsumerQNA dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("qna_seq");
			dto.setQnaNum(seq);
			
			dao.insertData("consumer.insertQna", dto);
			
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if(saveFileName == null) continue;
					
					String originalFileName = mf.getOriginalFilename();
					
					dto.setOriginalFileName(originalFileName);
					dto.setSaveFileName(saveFileName);
					
					insertFile(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertAnswer(ConsumerQNA dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFile(ConsumerQNA dto) throws Exception {
		try {
			dao.insertData("consumer.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<ConsumerFAQ> populList(Map<String, Object> map) {
		List<ConsumerFAQ> list = null;
		
		try {
			list = dao.selectList("consumer.populList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<ConsumerFAQ> fqaList(Map<String, Object> map) {
		List<ConsumerFAQ> list = null;
		
		try {
			list = dao.selectList("consumer.faqList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("consumer.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateReview(int num) throws Exception {
		
		try {
			dao.updateData("consumer.updateReview", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFAQ(ConsumerFAQ dto) throws Exception {
		try {
			int seq = dao.selectOne("faq_seq");
			dto.setFaqNum(seq);
			
			dao.insertData("consumer.insertFaq", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	
}
