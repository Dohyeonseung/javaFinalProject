package com.sp.app.admin.management;

import java.util.List;
import java.util.Map;


public interface ManagementService {
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public Member readMember(String userId);
	
	public void deleteMember(Map<String, Object> map) throws Exception;
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
	public List<Member> listMemberState(String userId);
	public Member readMemberState(String userId);
}
