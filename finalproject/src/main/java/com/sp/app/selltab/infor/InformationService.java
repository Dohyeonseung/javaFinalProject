package com.sp.app.selltab.infor;

import java.util.List;
import java.util.Map;

public interface InformationService {
	public int dataCount(Map<String, Object> map);
	public List<Information> listInformation(Map<String, Object> map);
}
