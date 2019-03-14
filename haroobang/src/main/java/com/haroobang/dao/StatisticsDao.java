package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface StatisticsDao {

	int getTotalPriceDao();

	int getTotalCheckinPriceDao();

	List<ReservationVO> getMonthCountDao();

	

}
