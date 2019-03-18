package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.StatisticsDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.StatisticsVO;

@Service("StatisticsService")
public class StatisticsServiceImpl implements StatisticsService{
	
	@Autowired
	@Qualifier("StatisticsDao")
	private StatisticsDao statisticsDao;

	@Override
	public int getTotalPriceService() {
		int price = statisticsDao.getTotalPriceDao();
		return price;
	}

	@Override
	public int getTotalCheckinPriceService() {
		int price = statisticsDao.getTotalCheckinPriceDao();
		return price;
	}

	@Override
	public List<ReservationVO> getMonthCountService() {
		List<ReservationVO> monthCount = statisticsDao.getMonthCountDao();
		return monthCount;
	}

	@Override
	public StatisticsVO getStatisticsService(int memberNo) {
		StatisticsVO list = statisticsDao.getStatisticsDao(memberNo);
		return list;
	}

}