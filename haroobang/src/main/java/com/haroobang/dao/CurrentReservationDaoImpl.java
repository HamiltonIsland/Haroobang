package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.CurrentReservationMapper;

@Repository("CurrentReservationDao")
public class CurrentReservationDaoImpl implements CurrentReservationDao{
	@Autowired
	@Qualifier("CurrentReservationMapper")
	private CurrentReservationMapper currentReservationMapper;

}
