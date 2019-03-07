package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.MessageRoomVO;
import com.haroobang.vo.MessagesVO;

public interface MessageMapper {

	List<MessageRoomVO> getMessageRoomList(int memberNo);

	List<AccountVO> getMessageMember(int memberNo2);

	List<MessagesVO> getMessageList(int roomNo);

	void insertMessages(MessagesVO vo);


}
