package com.sp.app.consumer;

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
			
			dao.insertData("insertQna", dto);
			
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

	
	
}
