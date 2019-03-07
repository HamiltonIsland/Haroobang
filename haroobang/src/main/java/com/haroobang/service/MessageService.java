package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.MessageRoomVO;
import com.haroobang.vo.MessagesVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface MessageService {

	List<MessageRoomVO> getMessageRoomListService(int memberNo);

	List<MessagesVO> getMessageListService(int roomNo);

	void insertMessagesService(MessagesVO vo);

}
