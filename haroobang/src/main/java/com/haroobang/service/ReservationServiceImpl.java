package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.ReservationDao;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	@Qualifier("ReservationDao")
	private ReservationDao reservationDao;

}
