package com.haroobang.dao;

import java.time.LocalDate;
import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface RoomDetailDao {

	String addLike(int roomNo, int memberNo);

	RoomVO findRoomDetail(int roomNo);

	AccountVO findMember(int memberNo);

	String addRoomReservation(ReservationVO reservationVo, List<LocalDate> dateList);

	List<String> findDateList(int roomNo);

	String findReservedDate(int roomNo, List<LocalDate> dateList);

}
