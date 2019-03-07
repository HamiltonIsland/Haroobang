package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.haroobang.mapper.MessageMapper;
import com.haroobang.mapper.RoomRegisterMapper;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.MessageRoomVO;

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

	
	

}
