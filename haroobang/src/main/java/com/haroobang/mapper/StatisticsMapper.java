package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.StatisticsVO;

public interface StatisticsMapper {

	int getTotalPrice();

	int getCheckinPrice();

	List<ReservationVO> getMonthCount();

	int getStatistics();


}
