package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface StatisticsMapper {

	int getTotalPrice();

	int getCheckinPrice();

	List<ReservationVO> getMonthCount();


}
