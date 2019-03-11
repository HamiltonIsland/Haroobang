package com.haroobang.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomDetailDao;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

@Service("roomDetailService")
public class RoomDetailServiceImpl implements RoomDetailService {

	@Autowired
	@Qualifier("RoomDetailDao")
	private RoomDetailDao roomDetailDao;

	@Override
	public String addLike(int roomNo, int memberNo) {
		
		String result =roomDetailDao.addLike(roomNo, memberNo);
		return result;
		
	}

	@Override
	public RoomVO findRoomDetail(int roomNo) {
		RoomVO room = roomDetailDao.findRoomDetail(roomNo);
		return room;
	}

	@Override
	public AccountVO findMember(int memberNo) {
		AccountVO member = roomDetailDao.findMember(memberNo);
		return member;
	}

	@Override
	public String addRoomReservation(ReservationVO reservationVo, List<LocalDate> dateList) {
		String message = roomDetailDao.addRoomReservation(reservationVo,dateList);
		return message;
		
	}

	@Override
	public List<String> findDateList(int roomNo) {
		
		List<String> dateList = roomDetailDao.findDateList(roomNo);
		return dateList;
	}

	@Override
	public String findReservedDate(int roomNo, List<LocalDate> dateList) {
		
		String result = roomDetailDao.findReservedDate(roomNo, dateList);
		return result;
		
	}

	@Override
	public void roomDelete(int roomNo) {
		
		roomDetailDao.roomDelete(roomNo);
		
	}

	@Override
	public void commentReport(int commentNo, String content, int memberNo) {
		
		roomDetailDao.commentReport(commentNo, content, memberNo);
		
	}

}
