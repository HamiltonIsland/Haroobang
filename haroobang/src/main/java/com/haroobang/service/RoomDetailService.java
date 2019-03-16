package com.haroobang.service;

import java.time.LocalDate;
import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface RoomDetailService {

	String addLike(int roomNo, int memberNo);

	RoomVO findRoomDetail(int roomNo);

	AccountVO findMember(int memberNo);

	String addRoomReservation(ReservationVO reservationVo, List<LocalDate> dateList);

	List<String> findDateList(int roomNo);

	void roomDelete(int roomNo);

	String commentReport(int commentNo, String content, int memberNo);

	String findReservedDate(int roomNo, String checkinDate, String endDate);

	String findMyLike(int roomNo, int memberNo);

	void updateFinalPoint(int memberNo, int finalPoint);

	String deleteLike(int roomNo, int memberNo);

}
