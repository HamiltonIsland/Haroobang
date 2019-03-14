package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.StatisticsMapper;

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

	
	
}
