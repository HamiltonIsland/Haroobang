package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.common.Util;
import com.haroobang.dao.AccountDao;
import com.haroobang.dao.RoomRegisterDao;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.RoomVO;

@Service("RoomRegisterService")
public class RoomRegisterServiceImpl implements RoomRegisterService{
	
	@Autowired
	@Qualifier("RoomRegisterDao")
	private RoomRegisterDao roomRegisterDao;

	@Override
	public void roomRegisterService(RoomVO vo) {
		roomRegisterDao.roomRegisterDao(vo);
		
	}

	
	

}
