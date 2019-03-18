package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.StatisticsVO;

public interface StatisticsDao {

	int getTotalPriceDao();

	int getTotalCheckinPriceDao();

	List<ReservationVO> getMonthCountDao();

	StatisticsVO getStatisticsDao();

	

}
