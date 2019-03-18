package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.StatisticsVO;

public interface StatisticsService {

	int getTotalPriceService();

	int getTotalCheckinPriceService();

	List<ReservationVO> getMonthCountService();

	StatisticsVO getStatisticsService();


}
