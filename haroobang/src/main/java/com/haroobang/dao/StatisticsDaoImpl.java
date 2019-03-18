package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.StatisticsMapper;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.StatisticsVO;

@Repository("StatisticsDao")
public class StatisticsDaoImpl implements StatisticsDao{
	
	@Autowired
	@Qualifier("StatisticsMapper")
	private StatisticsMapper statisticsMapper;

	@Override
	public int getTotalPriceDao() {
		int price = statisticsMapper.getTotalPrice();
		return price;
	}

	@Override
	public int getTotalCheckinPriceDao() {
		int price = statisticsMapper.getCheckinPrice();
		return price;
	}

	@Override
	public List<ReservationVO> getMonthCountDao() {
		
		List<ReservationVO> monthCount = statisticsMapper.getMonthCount();
		return monthCount;
	}

	@Override
	public StatisticsVO getStatisticsDao() {
		StatisticsVO list=new StatisticsVO();
		int memberCount= statisticsMapper.getStatistics();
		list.setMemberCount(memberCount);
		return list;
	}

	
	
}
