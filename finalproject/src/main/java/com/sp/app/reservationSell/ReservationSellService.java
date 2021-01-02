package com.sp.app.reservationSell;

import java.util.List;
import java.util.Map;

public interface ReservationSellService {
	public void insertReservationSell(ReservationSell dto, String pathname) throws Exception;
	public List<ReservationSell> listReservationSell(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public ReservationSell readReservationSell(int productNum);
	public void updateReservationSell(ReservationSell dto, String pathname) throws Exception;
	public void deleteReservationSell(int productNum,String pathname, String userId) throws Exception;
	
	public List<ReservationSell> listCategory(Map<String, Object> map);
}
