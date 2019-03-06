package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomReservationMapper;

@Repository("RoomReservationDao")
public class RoomReservationDaoImpl implements RoomReservationDao {
	
	@Autowired
	@Qualifier("RoomReservationMapper")
	RoomReservationMapper roomReservationMapper;
	

}
