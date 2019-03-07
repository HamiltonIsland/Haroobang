package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.MessageRoomVO;
import com.haroobang.vo.MessagesVO;

public interface MessageDao {

	List<MessageRoomVO> getMessageRoomListDao(int memberNo);

	List<MessagesVO> getMessageListDao(int roomNo);

	void insertMessagesDao(MessagesVO vo);

}
