package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.MessageDao;
import com.haroobang.dao.RoomRegisterDao;
import com.haroobang.vo.MessageRoomVO;
import com.haroobang.vo.MessagesVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Service("MessageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	@Qualifier("MessageDao")
	private MessageDao messageDao;

	@Override
	public List<MessageRoomVO> getMessageRoomListService(int memberNo) {
		List<MessageRoomVO> list = messageDao.getMessageRoomListDao(memberNo);
		return list;
	}

	@Override
	public List<MessagesVO> getMessageListService(int roomNo) {
		List<MessagesVO> list = messageDao.getMessageListDao(roomNo);
		return list;
	}

	@Override
	public void insertMessagesService(MessagesVO vo) {
		messageDao.insertMessagesDao(vo);
	}

	@Override
	public int getMessageRoomNoService(int memberNo, int loginMemberNo) {
		int messageRoomNo = messageDao.getMessageRoomNoDao(memberNo,loginMemberNo);
		return messageRoomNo;
	}

	

	
}
