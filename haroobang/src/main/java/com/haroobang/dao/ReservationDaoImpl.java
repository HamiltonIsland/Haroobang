package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.ReservationMapper;

@Repository("ReservationDao")
public class ReservationDaoImpl implements ReservationDao{
	
	@Autowired
	@Qualifier("ReservationMapper")
	private ReservationMapper reservationMapper;
}
