package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomListDao;

@Service("RoomListService")
public class RoomListServiceImpl implements RoomListService{
	
	@Autowired
	@Qualifier("RoomListDao")
	private RoomListDao roomlistDao;

}
