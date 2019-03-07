package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.MessageRoomVO;

public interface MessageDao {

	List<MessageRoomVO> getMessageRoomListDao(int memberNo);

}
