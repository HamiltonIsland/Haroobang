package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomReservationDao;

@Service("RoomReservationService")
public class RoomReservationServiceImpl implements RoomReservationService {
	
	@Autowired
	@Qualifier("RoomReservationDao")
	RoomReservationDao roomReservationDao;
	
	


}
