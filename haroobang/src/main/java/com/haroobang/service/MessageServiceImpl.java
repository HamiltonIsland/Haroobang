package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.MessageDao;
import com.haroobang.dao.RoomRegisterDao;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Service("MessageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	@Qualifier("MessageDao")
	private MessageDao messageDao;

	
}
