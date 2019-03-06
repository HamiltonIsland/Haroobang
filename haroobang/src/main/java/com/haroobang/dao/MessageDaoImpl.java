package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.MessageMapper;
import com.haroobang.mapper.RoomRegisterMapper;

@Repository("MessageDao")
public class MessageDaoImpl implements MessageDao{
	
	@Autowired
	@Qualifier("MessageMapper")
	private MessageMapper messageMapper;

	
	

}
