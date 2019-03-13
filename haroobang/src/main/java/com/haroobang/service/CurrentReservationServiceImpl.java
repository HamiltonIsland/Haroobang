package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.CurrentReservationDao;

@Service("CurrentReservationService")
public class CurrentReservationServiceImpl implements CurrentReservationService{
	@Autowired
	@Qualifier("CurrentReservationDao")
	private CurrentReservationDao currentReservationDao;
}
