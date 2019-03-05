package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomListMapper;

@Repository("RoomListDao")
public class RoomListDaoImpl implements RoomListDao{
	
	@Autowired
	@Qualifier("RoomListMapper")
	private RoomListMapper roomListMapper;
}
