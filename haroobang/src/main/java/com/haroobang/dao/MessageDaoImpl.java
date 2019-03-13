package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.haroobang.mapper.MessageMapper;
import com.haroobang.mapper.RoomRegisterMapper;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.MessageRoomVO;
import com.haroobang.vo.MessagesVO;

@Repository("MessageDao")
public class MessageDaoImpl implements MessageDao{
	
	@Autowired
	@Qualifier("MessageMapper")
	private MessageMapper messageMapper;

	@Override
	public List<MessageRoomVO> getMessageRoomListDao(int memberNo) {
		List<MessageRoomVO> list = messageMapper.getMessageRoomList(memberNo);
		for (MessageRoomVO vo : list) {
			int memberNo2=0;
			List<AccountVO> member;
			if(vo.getMemberNo()==memberNo) {
				memberNo2=vo.getMemberNo2();
				member = messageMapper.getMessageMember(memberNo2);
			}else {
				memberNo2=vo.getMemberNo();
				member = messageMapper.getMessageMember(memberNo2);
			}
			vo.setMemberList(member);
		}
		return list;
	}

	@Override
	public List<MessagesVO> getMessageListDao(int roomNo) {
		List<MessagesVO> list = messageMapper.getMessageList(roomNo);
		return list;
	}

	@Override
	public void insertMessagesDao(MessagesVO vo) {
		messageMapper.insertMessages(vo);
		
	}

	@Override
	public int getMessageRoomNoDao(int memberNo, int loginMemberNo) {
		int messageRoomNo=0;
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberNo",memberNo);
		params.put("loginMemberNo",loginMemberNo);
		try {
			messageRoomNo = messageMapper.getMessageRoomNo(params);
		}catch(Exception ex) {
			messageMapper.insertMessageRoom(params);			
			messageRoomNo = messageMapper.getMessageRoomNo(params);
			
			//방 만들자마자 첫 메시지
			MessagesVO vo = new MessagesVO();
			vo.setContent("안녕하세요~~~~~");
			vo.setMemberNo(memberNo);
			vo.setMessageRoomNo(messageRoomNo);
			
			messageMapper.insertMessages(vo);
		}
		
		
		return messageRoomNo;
	}

	@Override
	public int countMessageDao(int memberNo) {
		int message = messageMapper.countMessage(memberNo);
		return message;
	}

	
	

}
