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
		room.setMemberNickname(roomDetailDao.findMemberNickname(roomNo));
		return room;
	}

	@Override
	public AccountVO findMember(int memberNo) {
		AccountVO member = roomDetailDao.findMember(memberNo);
		return member;
	}

	@Override
	public String addRoomReservation(ReservationVO reservationVo, List<LocalDate> dateList,String startDate,String endDate) {
		int reservationNo = roomDetailDao.addRoomReservation(reservationVo,dateList);
		roomDetailDao.addStartDateEndDate(startDate,reservationVo.getRoomNo(),reservationNo);
		roomDetailDao.addStartDateEndDate(endDate,reservationVo.getRoomNo(),reservationNo);
		return "success";
		
	}

	@Override
	public List<String> findDateList(int roomNo) {
		
		List<String> dateList = roomDetailDao.findDateList(roomNo);
		return dateList;
	}

	@Override
	public String findReservedDate(int roomNo, String checkinDate, String endDate) {
		
		String result = roomDetailDao.findReservedDate(roomNo, checkinDate,endDate);
		return result;
		
	}

	@Override
	public void roomDelete(int roomNo) {
		
		roomDetailDao.roomDelete(roomNo);
		
	}

	@Override
	public String commentReport(int commentNo, String content, int memberNo) {
		
		String result = roomDetailDao.commentReport(commentNo, content, memberNo);
		return result;
		
	}

	@Override
	public String findMyLike(int roomNo, int memberNo) {
		String result = roomDetailDao.findMyLike(roomNo, memberNo);
		return result;
	}

	@Override
	public void updateFinalPoint(int memberNo,int finalPoint) {
		roomDetailDao.updateFinalPoint(memberNo,finalPoint);
		
	}

	@Override
	public String deleteLike(int roomNo, int memberNo) {
		String result = roomDetailDao.deleteLike(roomNo, memberNo);
		return result;
	}

	@Override
	public String findIdenticalDate(String checkinDate, String endDate,int roomNo) {
		String result = roomDetailDao.findIdenticalDate(checkinDate, endDate,roomNo);
		return result;
		
	}

}
